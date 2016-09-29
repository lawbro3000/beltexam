class UsersController < ApplicationController
def index

end

def create
  user = User.new(fname:params[:fname],lname:params[:lname],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation])
  if user.valid?
    user.save
    puts user.errors.full_messages
    session[:user_id] = user.id
    redirect_to '/users/profile'
  else
    redirect_to '/', :notice => user.errors.full_messages
  end

end

def login
  if !params[:email].blank? && !params[:password].blank?
    user = User.find_by_email(params[:email])
    if user
      if  user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/users/profile'
      else
        redirect_to '/', :alert =>  "email password combo dont match"
      end
    else
      redirect_to '/', :alert =>  "email doesnt exist"
    end
  else
    redirect_to '/', :alert =>  "email and password cant be blank"
  end
end



def new
  user = User.new(fname:params[:fname],lname:params[:lname],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation])
  if user.valid?
    user.save
    puts user.errors.full_messages
    session[:user_id] = user.id
    redirect_to '/users/profile'
  else
    redirect_to '/', :notice => user.errors.full_messages
  end

end


def show
	@user = User.find(session[:user_id])
  @alluser = User.all
end

def profile
	@user = User.find(session[:user_id])
  @user_all = User.all
  @memberships_all = Membership.all
  @group_all= Group.all
	@user = User.find(session[:user_id])
  @alluser = User.all
end
end
