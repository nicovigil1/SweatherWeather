class Forecast
  attr_reader :id
  def initialize(city_state)
    location = city_state.split(",")
    @city = location[0]
    @state = location[1]
    @location_service = LocationService.new
    @id = 1
  end 

  def predict
    coord = @location_service.find_coord(@city, @state)
    weather_service = WeatherService.new(coord)
    weather_service.weather
  end 
end 