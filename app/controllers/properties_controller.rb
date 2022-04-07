class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    render json: @properties, status: :ok
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
    @property = Property.find(params[:id])
    if @property.update(property_params)
      render json: @property, status: :created
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  private

  def property_params
    params.require(:property).permit(:address, :size, :price, :year_built)
  end
end