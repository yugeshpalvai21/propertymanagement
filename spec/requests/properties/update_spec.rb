require 'rails_helper'

describe 'PUT /properties' do
  describe 'valid property attributes' do
    let!(:property) { create(:property) }
    it 'returns success status' do
      put "/properties/#{property.id}", params: { 
        property: {
          address: 'different address',
          size: 1234,
          price: 3452.23,
          year_built: 2020
        }
      }
      expect(response).to have_http_status(:created)
      expect(property.reload.address).to eq 'different address'
    end 
  end
  
  describe 'invalid property attributes' do
    let!(:property) { create(:property) }
    it 'returns error status' do
      put "/properties/#{property.id}", params: { 
        property: {
          address: "",
          size: 1234,
          price: 3452.23,
          year_built: 2020
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end 
  end
end