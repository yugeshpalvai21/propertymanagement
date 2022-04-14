module JsonWebToken
  extend ActiveSupport::Concern

  SECRET_KEY = Rails.application.credentials["secret_key_base"]

  def jwt_encode(payload, exp = 2.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode
  end
end