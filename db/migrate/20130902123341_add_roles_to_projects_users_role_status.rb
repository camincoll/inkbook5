class AddRolesToProjectsUsersRoleStatus < ActiveRecord::Migration
  	def change
	  	create_table :roles do |t|
	    	t.integer :user_id
	    	t.integer :project_id
	    	t.integer :role_status_id
	    	t.string :title
	      	t.timestamps
	    end
	    add_index :roles, [:user_id, :project_id, :role_status_id]
	end

  	def change
	    create_table :role_status do |r|
	    	r.string :name
    	end
    end
end
