class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :user_lists
  has_many :lists, through: :user_lists

  # Validations
  validates_presence_of :name, :email, :password_digest
end
