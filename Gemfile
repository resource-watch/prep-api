source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Slugs generation
gem 'friendly_id'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'

# Rails plugins
gem 'puma', '~> 3.7'
gem 'rack-cors', :require => 'rack/cors'
gem 'faraday'
gem 'paperclip', '~> 5.1.0'
gem 'aws-sdk', '~> 2.3.0'

gem 'awesome_print', '1.6.1'

# Active record
gem 'pg', '~> 0.18'
# Active record serializer
gem 'active_model_serializers', '~> 0.10.0'

# Active admin
gem 'devise'
gem 'draper'
gem 'simple_command'

group :development, :test do
  gem 'dotenv-rails'
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails', '4.8.0'
end

group :test do
  gem 'rspec-rails', '3.5.0'
  gem 'database_cleaner', '1.5.3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors', '2.1.1'
  gem 'binding_of_caller', '0.7.2'
  gem 'web-console', '>= 3.3.0'
  gem 'annotate'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

