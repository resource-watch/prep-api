source 'https://rubygems.org'

ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc2', '< 5.1'

# Rails plugins
gem 'puma', '~> 3.0'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'dotenv-rails', '~> 2.1.1'
gem 'paperclip', '~> 5.0.0.beta1'
gem 'rack-cors', :require => 'rack/cors'
gem 'faraday', '~> 0.9.2'

# Assets managment
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'autoprefixer-rails'
gem 'jquery-rails'

# Active record
gem 'pg', '~> 0.18'
# Active record serializer
gem 'active_model_serializers', '~> 0.10.0'

# Active admin
gem 'devise', github: 'plataformatec/devise'
gem 'activeadmin', github: 'activeadmin'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'kaminari', github: 'amatsuda/kaminari', branch: '0-17-stable'
gem 'formtastic', github: 'justinfrench/formtastic'
gem 'draper', github: 'audionerd/draper', branch: 'rails5', ref: 'e816e0e587'
# To fix a Draper deprecation error
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'

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
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'quiet_assets'
  gem 'annotate'
end

# Required for Heroku
gem 'rails_12factor', group: :production
