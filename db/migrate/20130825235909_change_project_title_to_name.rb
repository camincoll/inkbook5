class ChangeProjectTitleToName < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.rename :title, :name
    end
  end
end
