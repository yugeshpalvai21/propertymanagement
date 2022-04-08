require 'rails_helper'

describe 'PUT /properties' do
  let(:user) { create(:user) }
  let!(:property) { create(:property) }
  describe 'authenticated user' do
    describe 'valid property attributes' do  
      it 'returns success status' do
        put "/properties/#{property.id}", params: { 
          property: {
            address: 'different address',
            size: 1234,
            price: 3452.23,
            year_built: 2020
          }
        }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }
        expect(response).to have_http_status(:created)
        expect(property.reload.address).to eq 'different address'
      end 
    end
    
    describe 'invalid property attributes' do
      it 'returns error status' do
        put "/properties/#{property.id}", params: { 
          property: {
            address: "",
            size: 1234,
            price: 3452.23,
            year_built: 2020
          }
        }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }
        expect(response).to have_http_status(:unprocessable_entity)
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:address]).to eq(["can't be blank"])
      end 
    end
  end
  describe 'un-authenticated user' do
    it 'returns invalid user response' do
      put "/properties/#{property.id}", params: { 
        property: {
          address: 'different address',
          size: 1234,
          price: 3452.23,
          year_built: 2020
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq "In Valid User"
    end
  end
end