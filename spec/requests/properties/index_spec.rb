require 'rails_helper'

describe 'GET /properties' do
  let!(:properties) { create_list(:property, 5) }
  it 'returns list of properties' do
    get "/properties"
    expect(response).to have_http_status(:ok)
    
    json = JSON.parse(response.body)
    expect(json.count).to eq 5
  end 
end