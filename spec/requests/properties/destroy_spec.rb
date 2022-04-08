require 'rails_helper'

describe 'DELETE /properties/:id' do
  let!(:property) { create(:property) }
  let(:user) { create(:user) }
  describe 'authenticated user' do
    it 'returns success status after property destroyed' do
      delete "/properties/#{property.id}", headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }
      expect(response).to have_http_status(:ok)
      expect(Property.count).to eq 0
      
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq "property deleted successfully"
    end
  end
  describe 'unauthenticated user' do
    it 'returns in valid user message' do
      delete "/properties/#{property.id}", headers: { 'X-Username': user.username, 'X-Token': '123456' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end 
end