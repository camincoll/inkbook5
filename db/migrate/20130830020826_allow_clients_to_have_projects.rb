class AllowClientsToHaveProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :client_id, :integer
  	add_column :clients, :project_id, :integer
  	add_index :clients, :project_id
  end

end
