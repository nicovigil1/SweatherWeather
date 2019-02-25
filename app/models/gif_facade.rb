class GifFacade
  attr_reader :summary, :time, :url
  def initialize(daily_forcast)
    @summary = daily_forcast[:summary]
    @time = daily_forcast[:time]
    @url = find_gif
  end 

  def find_gif 
    service = GifService.new
    service.gif_from_summary(@summary)
  end 
end 