class UsersController < ApplicationController
  def create
    user = User.new(users_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.name}"
      redirect_to '/users/index'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  
  def show
      @user = User.find(params[:id])
  end

  private
  def users_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
