class InstagramMedium < ApplicationRecord
  belongs_to :place
  validates_presence_of :link, :added_by
end
