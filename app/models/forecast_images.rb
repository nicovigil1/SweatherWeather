class ForecastImages
  attr_reader :images, :id
  def initialize(location)
    @daily_forecast = gen_daily_forecast(location)
    @images = gen_gif_facades
    @id = nil
  end 

  def gen_gif_facades
    @daily_forecast.map do |forecast|
      GifFacade.new(forecast)
    end 
  end

  def gen_daily_forecast(location)
    Forecast.new(location).predict[:daily][:data]
  end 
end 