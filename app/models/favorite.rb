class Favorite < ApplicationRecord 
  def self.show_favorites(token)
    @favorites ||= Favorite.select(:location).where(api_key: token)
    @stored_favorites ||= @favorites.map do |favorite| 
      FavoriteFacade.new(favorite.location, favorite.id)
    end
  end 
end