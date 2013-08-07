class ChangeDateFormatInAssignmentsTable < ActiveRecord::Migration
  def change
  	change_column :assignments, :due_date, :date
  end
end
