class Api::V1::GifsController < ApplicationController
  def index
    render json: GifSerializer.new(ForecastImages.new(params[:location]))
  end 
end 
