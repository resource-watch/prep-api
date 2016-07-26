class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :http_basic_authenticate if Rails.env == 'production'

  def jwt_authentication!
    # @auth = Faraday.post "#{ENV['RW_API_URL']}/auth"

    # redirect to root path if auth fail
    # redirect_to root_url, notice: 'You don\'t have authorisation.'

    # if auth token is valid
    return false
  end

  def get_current_user
    # Use this method to get current_user
  end

  private

    def http_basic_authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['AUTH_USERNAME'] && password == ENV['AUTH_PASSWORD']
      end
    end

end
