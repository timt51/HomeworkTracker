class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def load_assignment
  	@assignment = Assignment.find_or_initialize_by_id(params[:id], user_id: session[:user_id])
  end

  def set_schedule
    @schedule = Schedule.find_or_initialize_by_id(params[:id], user_id: session[:user_id], date: Date.today)
  end

  def all_assignments_due_dates
    @assignments_and_due_dates = {}
    Assignment.all.each do |assignment|
      if @assignments_and_due_dates.has_key?(assignment.due_date)
        @assignments_and_due_dates[assignment.due_date] << assignment
      else
        @assignments_and_due_dates[assignment.due_date] = [assignment]
      end
    end
    @assignments_and_due_dates
  end

  def make_schedule
    Schedule.destroy_all
    @assignments_and_due_dates.each_key do |due_date|
      schedule = Schedule.new(:date => due_date)
      schedule.assignments = @assignments_and_due_dates[due_date]
      schedule.save
    end
  end
end
