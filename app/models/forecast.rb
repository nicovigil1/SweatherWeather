class Forecast
  attr_reader :id
  def initialize(city_state)
    @cache = TimeHash.new
    location = through_cache(city_state, city_state.split(","))
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

  def through_cache(key, pair)
    @cache[key] || @cache.put(key.to_s, pair, 3600)
  end 
end 