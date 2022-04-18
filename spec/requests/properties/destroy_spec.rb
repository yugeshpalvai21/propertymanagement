require 'rails_helper'

def confirm_and_login_user
  create(:user)
  post "/login", params: { 
    email: "yugeshpalvai@gmail.com",
    password: "123456"
  }
  return response.headers["X-Auth-Token"]
end

describe 'DELETE /properties/:id' do
  let!(:property) { create(:property) }
  describe 'authenticated user' do
    it 'returns success status after property destroyed' do
      token = confirm_and_login_user
      delete "/properties/#{property.id}", headers: { 'X-Auth-Token': token }
      expect(response).to have_http_status(:ok)
      expect(Property.count).to eq 0
      
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq "property deleted successfully"
    end
  end
  describe 'unauthenticated user' do
    it 'returns in valid user message' do
      delete "/properties/#{property.id}", headers: { 'X-Auth-Token': 'sdfsdfsfs' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end 
end