FactoryBot.define do
  factory :user do
    username { "adminuser" }
    authentication_token { "xyz123" }
  end
end
