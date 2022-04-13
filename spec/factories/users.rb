FactoryBot.define do
  factory :user do
    username { "adminuser" }
    email { "yugeshpalvai@gmail.com" }
    password { "123456" }
    authentication_token { "xyz123" }
  end
end
