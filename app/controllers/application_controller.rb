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
      connect = faraday_connect
      connect.authorization :Bearer, session[:user_token]
      response = connect.get('/auth/check-logged')

      session[:current_user] = response.body
    end
  end

  def logout_api_gateway
    connect = faraday_connect
    connect.authorization :Bearer, session[:user_token]
    response = connect.get('/auth/logout')
  end

  def redirect_to_apigateway
    redirect_to "#{ENV['APIGATEWAY_URL']}/auth?callbackUrl=#{auth_login_url}&token=true"
  end

  def redirect_after_logout
    redirect_to "#{ENV['APIGATEWAY_URL']}/auth/logout?callbackUrl=#{auth_login_url}&token=true"
  end

  def access_denied(exception)
    render json: { unpermitted: exception.message }
  end

  private

    def faraday_connect
      Faraday.new(url: "#{ENV['APIGATEWAY_URL']}") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def http_basic_authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['AUTH_USERNAME'] && password == ENV['AUTH_PASSWORD']
      end
    end

    def set_current_user
      current_user if session[:user_token].present?
      @current_user = session[:current_user] || nil
      Thread.current[:user] = @current_user # set on thread to use it on admin_authorization model
    end

end
