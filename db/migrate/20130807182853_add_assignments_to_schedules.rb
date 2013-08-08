class AddAssignmentsToSchedules < ActiveRecord::Migration
  def change
  	add_column :schedules, :assignments, :text
  end
end
