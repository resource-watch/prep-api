source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'

# Rails plugins
gem 'puma', '~> 3.7'
gem 'dotenv-rails'
gem 'paperclip'
gem 'rack-cors', :require => 'rack/cors'
gem 'faraday'
gem 'aws-sdk', '>= 2.0.34'

# Assets managment
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'autoprefixer-rails'
gem 'jquery-rails'
gem 'select2-rails'

# Active record
gem 'pg', '~> 0.18'
# Active record serializer
gem 'active_model_serializers', '~> 0.10.0'

# Active admin
gem 'activeadmin'
gem 'devise'
gem 'draper'

# Libs
source 'https://rails-assets.org' do
  gem 'rails-assets-d3', '~> 3.5.16'
  gem 'rails-assets-vega', '~> 2.5.2'
  gem 'rails-assets-underscore'
  gem 'rails-assets-backbone'
end

group :development, :test do
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

# Required for Heroku
gem 'rails_12factor', group: :production
