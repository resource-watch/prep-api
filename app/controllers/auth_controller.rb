class AuthController < ApplicationController

  def login
    token = params[:token]
    if token.nil?
      redirect_to_apigateway
    else
      session[:user_token] = token
      redirect_to admin_root_path
    end
  end

  def logout
    logout_api_gateway
    session.delete(:user_token)
    session.delete(:current_user)
    redirect_after_logout
  end

end
