require 'rails_helper'

RSpec.describe List, type: :model do
  it { should have_many(:user_lists)}
  it { should have_many(:list_places)}
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
