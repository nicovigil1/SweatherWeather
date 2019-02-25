class FavoriteFacade 
  attr_reader :location, :current_weather, :id 
  def initialize(location, id)
    @id = id
    @location = location.delete(" ").split(",")
    @current_weather = Forecast.new(location.delete(" ")).predict
  end
end