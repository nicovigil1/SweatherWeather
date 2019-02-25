class ForecastImages
  attr_reader :images
  def initialize(forecast)
    @daily_forecast = forecast
    @images = gen_gif_facades
  end 

  def gen_gif_facades
    @daily_forecast.map do |forecast|
      GifFacade.new(forecast)
    end 
  end
end 