class AddRolesToProjectsUsersRoleStatus < ActiveRecord::Migration

  	

  	def change
	    create_table :role_status do |r|
	    	r.string :name
    	end
    end
end
