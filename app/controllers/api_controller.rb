class ApiController < ActionController::API
  include JSONAPI::ActsAsResourceController
  include JSONAPI::Utils
  include ApiHelper

  before_action :authenticate, except: [:index, :show]

  def authenticate_from_api
    begin
      token = request.env.fetch('HTTP_AUTHORIZATION', '').split(/Bearer /).last
      api_connection = connect_gateway
      api_connection.authorization :Bearer, token
      response = api_connection.get('/auth/check-logged')
      return true if response.success?
    rescue
    end
    false
  end

  protected

  def authenticate
    if !Rails.env.test? && !authenticate_from_api
      render json: { errors: [{ status: '401', title: 'Unauthorized' }] }, status: 401
    end
  end

end
