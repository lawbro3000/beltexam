class ShowController < ApplicationController

    def new
      group = Group.new(name:params[:name],description:params[:description])
      if group.valid?
        group.save
        puts group.errors.full_messages
        session[:group_id] = group.id
        redirect_to '/users/profile'
      else
        redirect_to '/', :notice => group.errors.full_messages
      end

    end

end
