class User < ApplicationRecord
  has_secure_password
  
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  # validates :authentication_token, presence: true
end
