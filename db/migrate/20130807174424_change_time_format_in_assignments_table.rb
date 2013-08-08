class ChangeTimeFormatInAssignmentsTable < ActiveRecord::Migration
  def change
  	change_column :assignments, :estimated_completion_time, :string, default: "10 minutes"
  end
end
