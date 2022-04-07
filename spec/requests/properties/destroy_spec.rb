require 'rails_helper'

describe 'DELETE /properties/:id' do
  let!(:property) { create(:property) }
  it 'returns success status after property destroyed' do
    delete "/properties/#{property.id}"
    expect(response.status).to eq 200
    expect(Property.count).to eq 0
  end 
end