class Api::V1::FavoritesController < ApplicationController
  def create
    if User.find_by(token: params[:api_key])
      Favorite.create(favorites_params)
      render json: {success: "favorite successfully added"}, status: 200
    else
      render json: {error: "user not associated with token"}, status: 401
    end
  end

  def index
    if User.find_by(token: params[:api_key])
      favorites = Favorite.show_favorites(params[:api_key])
      render json: FavoriteSerializer.new(favorites)
    else
      render json: {error: "try again"}, status: 401
    end
  end
  
  def destroy
    
  end 
  
  private 

  def favorites_params
    params.permit(:location, :api_key)
  end 
end
