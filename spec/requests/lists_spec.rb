require 'rails_helper'

RSpec.describe 'Lists API', type: :request do
  # add lists owner
  let(:user) {create(:user)}
  let(:lists){create_list(:list, 10, created_by: user.id)}
  let(:list_id){lists.first.id}

  let(:headers) {valid_headers}

  before :each do
    user.lists << lists
  end

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
  describe 'GET /lists/:id' do
    before { get "/lists/#{list_id}", params: {}, headers: headers }
    context 'when the record exists' do
      it 'returns the list' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(list_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'when the record does not exist' do
      let(:list_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  # Test suite for POST /lists
  describe 'POST /lists' do
    # valid payload
    let(:valid_attributes){{ title: 'Espresso', created_by: user.id.to_s, user_ids: [user.id.to_s] }.to_json}

    context 'when the request is valid' do
      before { post '/lists', params: valid_attributes, headers: headers }

      it 'creates a list' do
        expect(json['title']).to eq('Espresso')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/lists', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end


  # Test suite for DELETE /lists/:id
  describe 'DELETE /lists/:id' do
    before { delete "/lists/#{list_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

