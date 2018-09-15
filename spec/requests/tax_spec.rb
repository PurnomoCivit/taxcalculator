require 'rails_helper'

RSpec.describe 'Items API' do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:tax) { create_list(:tax, 1, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { tax.first.id }

  # Test suite for GET /user/:user_id/tax
  describe 'GET /user/:user_id/tax' do
    before { get "/user/#{user_id}/tax" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user tax' do
        expect(json.size).to eq(1)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # Test suite for GET /user/:user_id/tax/:id
  describe 'GET /user/:user_id/tax/:id' do
    before { get "/user/#{user_id}/tax/#{id}" }

    context 'when user tax exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the tax' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when user tax does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tax/)
      end
    end
  end

  # Test suite for PUT /user/:user_id/tax
  describe 'POST /user/:user_id/tax' do
    let(:valid_attributes) { { name: 'Visit Narnia', tax_code: '1', amount: '1000' } }

    context 'when request attributes are valid' do
      before { post "/user/#{user_id}/tax", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/user/#{user_id}/tax", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /user/:user_id/tax/:id
  describe 'PUT /user/:user_id/tax/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/user/#{user_id}/tax/#{id}", params: valid_attributes }

    context 'when tax exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(200)
      end

      it 'updates the tax' do
        updated_tax = Tax.find(id)
        expect(updated_tax.name).to match(/Mozart/)
      end
    end

    context 'when the tax does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tax/)
      end
    end
  end

  # Test suite for DELETE /user/:id
  describe 'DELETE /user/:id' do
    before { delete "/user/#{user_id}/tax/#{id}" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end