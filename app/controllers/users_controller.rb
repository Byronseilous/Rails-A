class UsersController < ApplicationController
	before_action :require_user, only: [:index, :show]
	def new
		@user=User.new
	end
	def create
		@user=User.new(user_params)

		if @user.save
			flash[:notice]= "account created"
			session[:user_id]=@user.id
			redirect_to '/' 
		else
			redirect_to '/signup', notice:"Fill all the fields correctly"
		end
	end

	def index

		@users=User.all
	end
	

	private
		def user_params
		  params.require(:user).permit(:first_name,:last_name,:email,:password)
		end
end

