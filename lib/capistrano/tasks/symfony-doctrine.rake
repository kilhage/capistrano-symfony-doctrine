namespace :symfony do
  namespace :doctrine do
    desc "Run app/console doctrine:migrations:migrate"
    task :migrations do
      on fetch(:symfony_doctrine_migrations_servers) do
        execute "cd '#{release_path}'; app/console doctrine:migrations:migrate #{fetch(:symfony_doctrine_migrations_flags)}"
      end
    end
    namespace :cache do
      desc "Run app/console doctrine:cache:clear-metadata"
      task :clear_metadata do
        on fetch(:symfony_doctrine_cache_clear_metadata_servers) do
          execute "cd '#{release_path}'; app/console doctrine:cache:clear-metadata #{fetch(:symfony_doctrine_cache_clear_metadata_flags)}"
        end
      end
      desc "Run app/console doctrine:cache:clear-query"
      task :clear_query do
        on fetch(:symfony_doctrine_cache_clear_query_servers) do
          execute "cd '#{release_path}'; app/console doctrine:cache:clear-query #{fetch(:symfony_doctrine_cache_clear_query_flags)}"
        end
      end
      desc "Run app/console doctrine:cache:clear-result"
      task :clear_result do
        on fetch(:symfony_doctrine_cache_clear_result_servers) do
          execute "cd '#{release_path}'; app/console doctrine:cache:clear-result #{fetch(:symfony_doctrine_cache_clear_result_flags)}"
        end
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :symfony_doctrine_migrations_flags, '--no-interaction --no-debug'
    set :symfony_doctrine_migrations_roles, :db
    set :symfony_doctrine_migrations_servers, -> { release_roles(fetch(:symfony_doctrine_migrations_roles)) }
    set :symfony_doctrine_cache_clear_metadata_flags, '--no-debug'
    set :symfony_doctrine_cache_clear_metadata_roles, :db
    set :symfony_doctrine_cache_clear_metadata_servers, -> { release_roles(fetch(:symfony_doctrine_cache_clear_metadata_flags)) }
    set :symfony_doctrine_cache_clear_query_flags, '--no-debug'
    set :symfony_doctrine_cache_clear_query_roles, :db
    set :symfony_doctrine_cache_clear_query_servers, -> { release_roles(fetch(:symfony_doctrine_cache_clear_query_roles)) }
    set :symfony_doctrine_cache_clear_result_flags, '--no-debug'
    set :symfony_doctrine_cache_clear_result_roles, :db
    set :symfony_doctrine_cache_clear_result_servers, -> { release_roles(fetch(:symfony_doctrine_cache_clear_result_roles)) }
  end
end
