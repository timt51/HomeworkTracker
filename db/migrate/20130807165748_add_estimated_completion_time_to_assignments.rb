class AddEstimatedCompletionTimeToAssignments < ActiveRecord::Migration
  def change
  	add_column :assignments, :estimated_completion_time, :string, default: "10 minutes"
  end
end
