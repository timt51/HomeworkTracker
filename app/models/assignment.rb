class Assignment < ActiveRecord::Base
	belongs_to :user
	belongs_to :schedule
	has_attached_file :image
end
