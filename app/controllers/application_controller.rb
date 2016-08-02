class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_user

  # before_action :http_basic_authenticate if Rails.env == 'production'

  def jwt_authentication
    unless session.key?('user_token')
      redirect_to_apigateway
    end
  end

  def current_user
    unless session.key?('current_user')
      connect = Faraday.new(url: "#{ENV['APIGATEWAY_URL']}") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      connect.authorization :Bearer, session[:user_token]
      response = connect.get('/auth/checkLogged');

      session[:current_user] = response.body
    end
  end

  def redirect_to_apigateway
    redirect_to "#{ENV['APIGATEWAY_URL']}/auth?callbackUrl=#{auth_login_url}&token=true"
  end

  private

    def http_basic_authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['AUTH_USERNAME'] && password == ENV['AUTH_PASSWORD']
      end
    end

    def set_current_user
      @current_user = session[:current_user] || nil
    end

end
