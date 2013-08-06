class SessionsController < ApplicationController
	def create
		@user = User.find_or_create_by_auth(request.env["omniauth.auth"])
		session[:user_id] = @user.id
		set_assignment
		@assignment.update_attributes(user: @user)
		redirect_to assignments_path, notice: "Logged in as #{@user.name}"
	end

	def destroy
		session[:user_id] = nil
		session[:order_id] = nil
		redirect_to root_path
	end
end
