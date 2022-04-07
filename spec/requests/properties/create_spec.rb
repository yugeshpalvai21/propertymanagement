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
      expect(response.status).to eq 201
    end 
  end
end