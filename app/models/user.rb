class User < ApplicationRecord
  validates :username, presence: true
  # validates :authentication_token, presence: true
end
