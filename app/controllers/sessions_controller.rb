class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      headers["X-Auth-Token"] = SecureRandom.base64(13)
      render json: { message: "Logged In Successfully" }, status: :ok
    else
      render json: { message: "Something went wrong" }, status: :unprocessable_entity
    end
  end
end