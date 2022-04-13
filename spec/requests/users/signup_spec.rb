require 'rails_helper'

  RSpec.describe "GET /users" do
    it "will creates new user" do
      post '/users', params: { user: {
        email: "yugeshpalvai@gmail.com",
        username: "yugeshpalvai",
        password: "123456",
        password_confirmation: '123456'
        }
      }
      expect(response).to have_http_status(:ok)
    end
  end