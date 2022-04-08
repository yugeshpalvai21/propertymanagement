class PagesController < ApplicationController
  def home
    render json: { message: 'Welcome to property management api' }, status: :ok
  end
end
