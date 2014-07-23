require 'pp'
class UsersController < ApplicationController
  skip_before_filter :authenticate, except: [:index]

  def index
    user = User.first
    render json: user, status: 200
  end

  def signup
    user = User.new(user_params)
    if user.save
      set_authorization user.authentication_token
      render json: user, status: 200, location: user
    else
      render json: user.errors, status: 401
    end
  end

  def signin
    user = User.login(
      user_params[:email],
      user_params[:password]
    )
    if user
      set_authorization user.authentication_token
      render json: user, status: 200
    else
      render json: 'Bad credentials', status: 401
    end
  end

  def logout
    unset_authorization
    render nothing: true, status: 204
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_authorization(token)
    self.headers['Authorization'] = token_header(token)
  end

  def unset_authorization
    self.request.env['HTTP_AUTHORIZATION'] = nil
    self.headers['Authorization'] = nil
  end
end
