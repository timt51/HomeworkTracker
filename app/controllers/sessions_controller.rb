class SessionsController < ApplicationController
	def create
		@user = User.find_or_initialize_by_auth(request.env["omniauth.auth"])
		session[:user_id] = @user.id
		if @user.new_record?
			@user.email = "homeworktracker@live.com"
			@user.save
			UserMailer.welcome_email(@user).deliver
		end
		load_assignment
		set_schedule
		redirect_to assignments_path, notice: "Logged in as #{@user.name}"
	end

	def destroy
		session[:user_id] = nil
		session[:assignment_id] = nil
		redirect_to root_path
	end
end