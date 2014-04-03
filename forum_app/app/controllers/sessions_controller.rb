class SessionsController < ApplicationController

	def new
	end


	def create
		@user = User.where(email: params[:email]).first
		if @user && @user.password == params[:password]
			flash[:notice] = "You're logged in"
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:alert] = "There was a problem logging you in"
			redirect_to root_path
		end
	end 

	def destroy
		session[:user_id] = nil
		flash[:alert] = "You've been logged out"
		redirect_to root_path
	end
end
