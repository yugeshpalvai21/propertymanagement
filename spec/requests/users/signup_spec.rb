require 'rails_helper'

  RSpec.describe "GET /users" do
    context "with valid attribute values" do
      it "will creates new user" do
        post '/users', params: { user: {
          email: "yugeshpalvai@gmail.com",
          username: "yugeshpalvai",
          password: "123456",
          password_confirmation: '123456'
          }
        }
        expect(response).to have_http_status(:ok)
        
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:message]).to eq "User Created Successfully"
      end
    end
    context "with invalid attribute values" do
      it "will return error message" do
        post "/users", params: { user: {
          email: "yugeshpalvai@gmail.com",
          username: "yugeshpalvai"
          }
        }

        expect(response).to have_http_status :unprocessable_entity
        
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:errors]).to match(["Password can't be blank"])
      end
    end

    context 'when existed user email given' do
      before(:example) { create(:user) }
      it 'will return the error message' do
        post '/users', params: { user: {
          email: "yugeshpalvai@gmail.com",
          username: "yugeshpalvai",
          password: "123456",
          password_confirmation: '123456'
          }
        }

        expect(response).to have_http_status :unprocessable_entity
        
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:errors]).to match(["Email has already been taken"])
      end
    end
  end