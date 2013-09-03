class Role < ActiveRecord::Base

	belongs_to :project
	belongs_to :user
	belongs_to :role_status

	validates :project_id, :presence => true
	validates :title, :presence => true

	attr_accessible :title

end