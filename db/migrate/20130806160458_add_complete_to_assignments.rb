class AddCompleteToAssignments < ActiveRecord::Migration
  def change
  	add_column :assignments, :complete, :boolean, default: false
  end
end
