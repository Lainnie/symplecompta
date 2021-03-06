require 'pp'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :authenticate

  private
  def token_header(token)
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  def authenticate
    authenticate_token || render_unauthorized
  end

  def render_unauthorized
    render json: 'Bad Credentials', status: 401
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(authentication_token: token)
    end
  end
end
