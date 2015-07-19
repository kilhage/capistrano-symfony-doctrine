namespace :symfony do
  namespace :doctrine do
    desc "Run app/console doctrine:migrations:migrate for the environment"
    task :migrations do
      on roles fetch(:symfony_doctrine_migrations_roles) do
        invoke "symfony:console", "doctrine:migrations:migrate", fetch(:symfony_doctrine_migrations_flags)
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :symfony_doctrine_migrations_flags, '--no-interaction'
    set :symfony_doctrine_migrations_roles, :db
  end
end
