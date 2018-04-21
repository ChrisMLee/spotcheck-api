class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.integer :rating
      t.string :created_by

      t.timestamps
    end
  end
end
