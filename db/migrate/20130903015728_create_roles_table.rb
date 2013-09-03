class CreateRolesTable < ActiveRecord::Migration

def change
	  	create_table :roles do |t|
	    	t.integer :user_id
	    	t.integer :project_id
	    	t.integer :role_status_id
	    	t.string :title
	      	t.timestamps
	    end
	end

end
