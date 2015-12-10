class SessionsController < ApplicationController

	def login
		redirect_to dashboard_index_path if current_user
	end
	
	def login_attempt
		user = User.find_by_name(params[:username])
	    if user && user.authenticate(params[:password])
	      session[:user_id] = user.id
	      redirect_to dashboard_index_path
	    else
	      redirect_to root_path
	    end
	end	

	def destroy
	    session[:user_id] = nil
	    redirect_to root_path
  	end
end	