class PropertiesController < ApplicationController
  before_action :authenticate_user, only: [:create]
  before_action :find_property, only: [:show, :update, :destroy]

  def index
    @properties = Property.all
    render json: @properties, status: :ok
  end

  def show
    render json: @property, status: :ok
  end
  
  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      render json: @property, status: :created
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
    render json: { message: 'property deleted successfully'}, status: :ok
  end

  private

  def find_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:address, :size, :price, :year_built)
  end

  def authenticate_user
    user = User.find_by(username: request.headers['X-Username'], authentication_token: request.headers['X-Token'])
    render json: { message: "In Valid User" }, status: :unprocessable_entity unless user
  end
end