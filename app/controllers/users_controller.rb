class UsersController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @users = User.all
    @new_user = User.new
  end

  def new
  end

  def create
    user = User.new(name:params[:name],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation], description:params[:description])
    if user.valid?
      user.save
      redirect_to '/users/index'
    else
      redirect_to '/', :notice => user.errors.full_messages
    end


  def make
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
      @friendships = User.find(params[:id]).friendships
  end

  end
end
