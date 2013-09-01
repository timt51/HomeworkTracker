class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.date :due_date

      t.timestamps
    end
  end
end
