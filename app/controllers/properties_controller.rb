class PropertiesController < ApplicationController
  def create
    @property = Property.new(property_params)

    if @property.save
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