require 'rails_helper'

describe 'GET /properties' do
  let!(:properties) { create_list(:property, 5) }
  it 'returns list of properties' do
    get "/properties"
    expect(response.status).to eq 200
    expect(Property.count).to eq 5
  end 
end