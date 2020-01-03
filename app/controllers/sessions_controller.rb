class SessionsController < ApplicationController

	def new
		
		
	end
	def create
		@user=User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id]=@user.id
			redirect_to '/', notice: "you're logged in as #{@user.first_name} #{@user.last_name}"
		else
			redirect_to '/login', notice: "There seems to be a problem, Please recheck your email and password"
		end
	end

	def destroy

		session[:user_id] = nil 
		reset_session
		redirect_to '/login' ,notice: "you have successfully logged out of your account"
	end
	def index 
	end
end
