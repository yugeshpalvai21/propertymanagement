require 'rails_helper'

RSpec.describe "POST /login" do
  context "with valid credentials" do
    it "will returns success message" do
      create(:user)
      post "/login", params: { 
        email: "yugeshpalvai@gmail.com",
        password: "123456"
      }

      expect(response).to have_http_status :ok
    end
  end

  context "with invalid credentials" do
    it "will returns error message" do
      create(:user)
      post "/login", params: { 
        email: "yugeshpalvai@gmail.com",
        password: "12s3456"
      }

      expect(response).to have_http_status :unprocessable_entity
    end
  end

  context "on successful login" do
    it "returns authenticity-token" do
      create(:user)
      post "/login", params: { 
        email: "yugeshpalvai@gmail.com",
        password: "123456"
      }
      
      expect(response.headers["X-Auth-Token"]).to be_present
    end
  end
end