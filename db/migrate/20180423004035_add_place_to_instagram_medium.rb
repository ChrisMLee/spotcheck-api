class AddPlaceToInstagramMedium < ActiveRecord::Migration[5.2]
  def change
    add_reference :instagram_media, :place, foreign_key: true
  end
end
