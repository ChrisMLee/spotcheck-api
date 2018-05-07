class UserList < ApplicationRecord
  belongs_to :user
  belongs_to :list, inverse_of: :user_lists
end
