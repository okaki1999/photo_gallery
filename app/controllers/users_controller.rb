class UsersController < ApplicationController
  before_action :redirect_logged_in_user, only: [:new, :create]
  skip_before_action :require_sign_in!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def redirect_logged_in_user
    redirect_to root_path if signed_in?
  end
end
