class Api::V1::BackgroundsController < ApplicationController
  def index
    if User.find_by(token: params[:api_key])
      render json: PhotoFacade.gen_photo(params[:coords])
    else
      render json: {error: "invalid request"}
    end
  end   
end 