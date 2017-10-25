require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PreparednesForResilience
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # API mode
    config.api_only = true

    # Setup scaffold
    config.generators do |g|
      g.assets          false
      g.helper          false
      g.test            false
    end

    # CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost', '*.prepdata.org'
        resource '*', :headers => :any, :methods => [:get, :post, :options, :delete, :put, :patch]
      end
    end

  end
end
