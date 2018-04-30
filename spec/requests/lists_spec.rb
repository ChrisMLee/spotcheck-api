require 'rails_helper'

RSpec.describe 'Lists API', type: :request do
  # add lists owner
  let(:user) {create(:user)}
  let(:list){create(:list)}
  let! user.lists << :list
  factory(:user) do
    after :create do
       
    end
  end

  let(:headers) {valid_headers}

  describe 'GET /lists' do
    before {get '/lists', params: {}, headers: headers}
      it 'returns lists' do
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
  end
end

# RSpec.describe 'Todos API', type :request do
#   # initialize test data
#   let!(:lists) { create_list(:list, 10)}
#   let(:list_id) {lists.first.id}

#   # Test suite for GET /lists
#   describe 'GET /lists' do
    
#   end

# end
