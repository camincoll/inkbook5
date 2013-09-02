class AddAttributesToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :abn, :integer
  end

end
