class UsersController < ApplicationController

	def index
		@users = User.all
		flash[:notice] = "Here are the users..."
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy

		@user = User.find(params[:id])
		if @user && @user.destroy
			flash[:notice] = "Your user has been deleted."
		else
			flash[:alert] = "There was an issue deleting that user..."
		end
		redirect_to "/users"
	end

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Your account was created!"
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:alert] = "There was a problem creating your account" 
			redirect_to new_user_path
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:notice] = "Changes made - good to go!"
			redirect_to user_path(@user)
		else
			flash[:alert] = "Uh Oh - there was an issue with with your updates" 
			redirect_to :back
		end
	end
	
	private

	def user_params
		params.require(:user).permit(:fname, :lname)
	end
end