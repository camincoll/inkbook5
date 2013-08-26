class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.date :start
      t.date :end
      t.decimal :value

      t.timestamps
    end
  end
end
