require 'rails_helper'

def confirm_and_login_user
  create(:user)
  post "/login", params: { 
    email: "yugeshpalvai@gmail.com",
    password: "123456"
  }
  return response.headers["X-Auth-Token"]
end

describe 'POST /properties' do
  describe 'authenticated user' do
    describe 'with valid property attributes' do
      it 'returns success status' do
        token = confirm_and_login_user
        post '/properties', params: { 
          property: {
            address: '123 street, USA',
            size: 1234,
            price: 3452.23,
            year_built: 2020
          }
        }, headers: { 'X-Auth-Token': token }
        
        expect(response).to have_http_status(:success)

        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:address]).to eq '123 street, USA'
      end 
    end
    describe 'invalid property attributes' do
      it 'returns error status' do
        token = confirm_and_login_user
        post '/properties', params: { 
          property: {
            address: "",
            size: 1234,
            price: 3452.23,
            year_built: 2020
          }
        }, headers: { 'X-Auth-Token': token }
        expect(response).to have_http_status(:unprocessable_entity)

        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:address]).to eq(["can't be blank"])
      end 
    end
  end
  describe 'un-authenticated user' do
    let(:user) { create(:user) }
    context 'with no header data' do
      it 'returns invalid request message' do
        post '/properties', params: { 
          property: {
            address: '123 street, USA',
            size: 1234,
            price: 3452.23,
            year_built: 2020
          }
        }

        expect(response).to have_http_status(:unprocessable_entity)
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:message]).to eq "In Valid User"
      end
    end
    context 'with wrong credentials' do
      it 'returns invalid request message' do
        post '/properties', params: { 
          property: {
            address: '123 street, USA',
            size: 1234,
            price: 3452.23,
            year_built: 2020
          }
        }, headers: { 'X-Auth-Token': 'sfsdfsdf' }

        expect(response).to have_http_status(:unprocessable_entity)
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:message]).to eq "In Valid User"
      end
    end
  end
end