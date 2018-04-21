class CreateListPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :list_places do |t|
      t.belongs_to :place
      t.belongs_to :list
      t.timestamps
    end
  end
end
