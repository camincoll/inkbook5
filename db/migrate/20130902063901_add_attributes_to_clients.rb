class AddAttributesToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :abn, :integer
  	add_column :clients, :address_id, :integer
  	add_column :clients, :phone_id, :integer

  	
  	add_column :clients, :floor_unit, :string
  	add_column :clients, :street_address, :string
  	add_column :clients, :suburb, :string
  	add_column :clients, :city, :string
  	add_column :clients, :state, :string
  	add_column :clients, :post_code, :integer
  	add_column :clients, :country, :string
  end

end
