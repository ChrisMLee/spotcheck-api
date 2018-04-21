class CreateUserLists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lists do |t|
      t.belongs_to :user
      t.belongs_to :list
      t.timestamps
    end
  end
end
