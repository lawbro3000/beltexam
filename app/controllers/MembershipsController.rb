def accept #inverse connection - you need to add all
  @user = User.find(session[:user_id])
  Membership.find_by(id: params[:id]).update(status:"accepted")

  redirect_to '/users/profile'
end


def ignore
  Membership.find_by(id: params[:id]).destroy 
  redirect_to '/users/profile'
end

def destroy #inverse connection - you need to delete both
 Membership.find_by(user_id: User.find(session[:user_id]), contact_id:User.find(params[:user_id])).destroy
 Membership.find_by(user_id: User.find(params[:user_id]), contact_id:User.find(session[:user_id])).destroy
 redirect_to '/users/profile'
end


def connecting
 Membership.create(user_id:session[:user_id], contact_id: params[:id], status:"pending")
 Membership.create(user_id:params[:user_id], contact_id: session[:user_id], status:"sent")
 puts "="*200
 redirect_to '/users/index'
end
end
