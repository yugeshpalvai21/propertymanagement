class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: "User Created Successfully" }, status: :ok
    else 
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private 

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end