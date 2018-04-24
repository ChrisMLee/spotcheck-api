class CreateInstagramMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :instagram_media do |t|
      t.string :link
      t.string :added_by

      t.timestamps
    end
  end
end
