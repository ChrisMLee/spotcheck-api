class Place < ApplicationRecord
  has_many :list_places
  has_many :lists, through: :list_places
  has_many :instagram_media
  # Validations
  validates_presence_of :name, :description, :rating, :created_by

end
