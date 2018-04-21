require 'rails_helper'

RSpec.describe Place, type: :model do
  it { should have_many(:list_places)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:created_by) }
end
