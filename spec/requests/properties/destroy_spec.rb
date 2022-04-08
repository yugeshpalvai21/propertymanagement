require 'rails_helper'

describe 'DELETE /properties/:id' do
  let!(:property) { create(:property) }
  it 'returns success status after property destroyed' do
    delete "/properties/#{property.id}"
    expect(response).to have_http_status(:ok)
    expect(Property.count).to eq 0
    
    json = JSON.parse(response.body).deep_symbolize_keys
    expect(json[:message]).to eq "property deleted successfully"
  end 
end