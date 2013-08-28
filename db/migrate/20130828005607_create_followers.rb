class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
    	t.integer :user_id
    	t.integer :follower_id
      	t.timestamps
    end

    add_index :followers, [:user_id, :follower_id]
  end
end
