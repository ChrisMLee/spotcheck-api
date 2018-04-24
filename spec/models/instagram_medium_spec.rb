require 'rails_helper'

RSpec.describe InstagramMedium, type: :model do
  it { should belong_to(:place) }

  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:added_by) }
end
