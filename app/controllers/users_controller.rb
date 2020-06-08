class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end 

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to signup_path
    else
      user = User.create(user_params)
      session[:user_id] = user.id 
      redirect_to welcome_path(user)
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end