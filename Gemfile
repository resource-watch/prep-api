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

gem 'sass-rails', '>= 5.0'
gem 'uglifier', '>= 1.3.0'

# Rails plugins
gem 'puma', '~> 3.7'
gem 'rack-cors', :require => 'rack/cors'
gem 'faraday'
gem 'paperclip', '~> 5.1.0'
gem 'aws-sdk', '~> 2.3.0'

# Active record
gem 'pg', '~> 0.18'

# Active record serializer
gem 'active_model_serializers', '~> 0.10.0'

# Active admin
gem 'activeadmin', github: 'activeadmin'
gem 'devise'
gem 'draper'

group :development, :test do
  gem 'dotenv-rails'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'annotate'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

