require 'pp'
class UsersController < ApplicationController
  skip_before_filter :authenticate, only: [:signin, :signup]
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
    user = User.find_by(
      email: user_params[:email],
      password: User.encrypt_password(user_params[:password])
    )
    if user
      set_authorization user.authentication_token
      render json: user, status: 200
    else
      render json: 'Bad credentials', status: 401
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_authorization(token)
    self.headers['Authorization'] = token_header(token)
  end
end
