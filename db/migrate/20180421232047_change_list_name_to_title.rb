class ChangeListNameToTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :lists, :name, :title
  end
end
