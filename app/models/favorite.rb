class Favorite < ApplicationRecord 
  def self.show_favorites(token)
    favorites = Favorite.select(:location).where(api_key: token)
    favorites.map do |favorite| 
      FavoriteFacade.new(favorite.location, favorite.id)
    end 
  end 
end 