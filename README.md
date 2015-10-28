# Capistrano::Symfony::Doctrine

doctrine migrations & cache clearing support for Capistrano 3.x

Makes it possible to run doctrine migrations and clear metadata, query & result cache

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-symfony'
gem 'capistrano-symfony-doctrine'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-symfony-doctrine

## Usage

Require in Capfile to use the default task:

```ruby
require 'capistrano/symfony-doctrine'
```

Configure in deploy.rb to execute the tasks:

```ruby
before 'deploy:updated', 'symfony:cache:clear_metadata'
before 'deploy:updated', 'symfony:cache:clear_query'
before 'deploy:updated', 'symfony:cache:clear_result'
before 'deploy:updated', 'symfony:doctrine:migrations'
```

### Configurable options:

```ruby
set :symfony_doctrine_cache_clear_metadata_flags, '--=env=prod'
set :symfony_doctrine_cache_clear_metadata_roles, :db
set :symfony_doctrine_cache_clear_query_flags, '--=env=prod'
set :symfony_doctrine_cache_clear_query_roles, :db
set :symfony_doctrine_cache_clear_result_flags, '--=env=prod'
set :symfony_doctrine_cache_clear_result_roles, :db
set :symfony_doctrine_migrations_flags, '--no-interaction'
set :symfony_doctrine_migrations_roles, :db
```

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `capistrano-symfony-doctrine.gemspec`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
