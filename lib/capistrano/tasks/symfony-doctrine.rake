namespace :symfony do
  namespace :doctrine do
    desc "Run app/console doctrine:migrations:migrate for the environment"
    task :migrations do
      on roles fetch(:symfony_doctrine_migrations_roles) do
        invoke "symfony:console", "doctrine:migrations:migrate", fetch(:symfony_doctrine_migrations_flags)
      end
    end
    namespace :doctrine do
      desc "Run app/console doctrine:cache:clear-metadata"
      task :clear_metadata do
        on roles fetch(:symfony_doctrine_cache_clear_metadata_roles) do
          invoke "symfony:console", "doctrine:cache:clear-metadata", fetch(:symfony_doctrine_cache_clear_metadata_flags)
        end
      end
      desc "Run app/console doctrine:cache:clear-query"
      task :clear_query do
        on roles fetch(:symfony_doctrine_cache_clear_query_roles) do
          invoke "symfony:console", "doctrine:cache:clear-query", fetch(:symfony_doctrine_cache_clear_query_flags)
        end
      end
      desc "Run app/console doctrine:cache:clear-result"
      task :clear_result do
        on roles fetch(:symfony_doctrine_cache_clear_result_roles) do
          invoke "symfony:console", "doctrine:cache:clear-result", fetch(:symfony_doctrine_cache_clear_result_flags)
        end
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :symfony_doctrine_migrations_flags, '--no-interaction'
    set :symfony_doctrine_migrations_roles, :db
    set :symfony_doctrine_cache_clear_metadata_flags, '--=env=prod'
    set :symfony_doctrine_cache_clear_metadata_roles, :db
    set :symfony_doctrine_cache_clear_query_flags, '--=env=prod'
    set :symfony_doctrine_cache_clear_query_roles, :db
    set :symfony_doctrine_cache_clear_result_flags, '--=env=prod'
    set :symfony_doctrine_cache_clear_result_roles, :db
  end
end
