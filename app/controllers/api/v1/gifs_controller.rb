class Api::V1::GifsController < ApplicationController
  def index
    if params[:location]
      render json: GifSerializer.new(ForecastImages.new(params[:location]))
    else
      render json: {error: "location not found"}, status: 404
    end
  end 
end 
