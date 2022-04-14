class SessionsController < ApplicationController
  include JsonWebToken

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      headers["X-Auth-Token"] = jwt_encode(user_id: @user.id)
      render json: { message: "Logged In Successfully" }, status: :ok
    else
      render json: { message: "Something went wrong" }, status: :unprocessable_entity
    end
  end
end