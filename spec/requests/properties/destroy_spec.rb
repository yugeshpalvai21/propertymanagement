require 'rails_helper'

describe 'DELETE /properties/:id' do
  let!(:property) { create(:property) }
  it 'returns success status after property destroyed' do
    delete "/properties/#{property.id}"
    expect(response).to have_http_status(:ok)
    expect(Property.count).to eq 0
  end 
end