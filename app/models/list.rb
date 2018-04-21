class List < ApplicationRecord
  has_many :user_lists
  has_many :users, through: :user_lists
  has_many :list_places
  has_many :places, through: :list_places

  # Validations
  validates_presence_of :title, :created_by
end
