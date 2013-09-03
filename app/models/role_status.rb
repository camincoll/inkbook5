class Role_status < ActiveRecord::Base
	validates :name, :presence => true
end