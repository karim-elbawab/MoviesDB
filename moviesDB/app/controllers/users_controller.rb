class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show, :edit, :watchlist]

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if User.find_by(email: @user.email).nil?  
	        if @user.confirm_password == @user.password   
				if @user.save
					redirect_to root_path, notice: 'Welcome! Please login.'
				else
					render action: :new
				end
			else
				flash[:alert] = "Your password didn't match with your confirm password"
				render action: :new  
			end
		else
			flash[:alert] = "This email is already used"
			render action: :new
		end
	end
	def show
		@user = current_user	
	end
	
	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)

		redirect_to @user
	end
	def watchlist
		@user = current_user
	end

protected
	
	def user_params
		params.require(:user).permit(:name, :email, :password, :confirm_password)
	end
end