class AddPaperclipFieldsToAssignments < ActiveRecord::Migration
	def change
		add_column :assignments, :image_file_name,    :string
			add_column :assignments, :image_content_type, :string
			add_column :assignments, :image_file_size,    :integer
			add_column :assignments, :image_updated_at,   :datetime
	end
end
