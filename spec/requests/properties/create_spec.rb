require 'rails_helper'

describe 'POST /properties' do
  describe 'valid property attributes' do
    it 'returns success status' do
      post '/properties', params: { 
        property: {
          address: '123 street, USA',
          size: 1234,
          price: 3452.23,
          year_built: 2020
        }
      }
      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:address]).to eq '123 street, USA'
    end 
  end
  describe 'invalid property attributes' do
    it 'returns error status' do
      post '/properties', params: { 
        property: {
          address: "",
          size: 1234,
          price: 3452.23,
          year_built: 2020
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:address]).to eq(["can't be blank"])
    end 
  end
end