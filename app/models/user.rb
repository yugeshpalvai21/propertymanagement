class User < ApplicationRecord
  has_secure_password
  
  validates :username, presence: true
  validates :authentication_token, presence: true
end
