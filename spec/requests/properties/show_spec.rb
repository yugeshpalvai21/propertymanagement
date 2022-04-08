require 'rails_helper'

describe 'GET /properties/:id' do
  let!(:property) { create(:property) }
  it 'returns details of specific property' do
    get "/properties/#{property.id}"
    expect(response).to have_http_status(:ok)
    expect(Property.count).to eq 1
    expect(Property.first.address).to eq "123 street, USA"
  end 
end