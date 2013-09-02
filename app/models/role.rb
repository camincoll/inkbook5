class Role < ActiveRecord::Base

	belongs_to :project
	belongs_to :user
	belongs_to :role_status

	validates :project_id, :presence => true
	validates :user_id # Can have a vacant role
	validates :role_status_id, :presence => true
	validates :title, :presence => true

end