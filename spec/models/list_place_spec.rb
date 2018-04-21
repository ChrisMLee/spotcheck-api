require 'rails_helper'

RSpec.describe ListPlace, type: :model do
  it { should belong_to(:list) }
  it { should belong_to(:place) }
end
