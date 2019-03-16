class Api::V1::BackgroundsController < ApplicationController
  def index
    if User.find_by(token: params[:api_key])
      coords = Forecast.new(params[:location]).coords
      render json: PhotoFacade.gen_photo(coords)
    else
      render json: {error: "invalid request"}
    end
  end   
end 