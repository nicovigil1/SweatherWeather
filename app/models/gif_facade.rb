class GifFacade
  attr_reader :summary, :time, :url
  def initialize(daily_forcast)
    @summary = daily_forcast[:summary]
    @time = daily_forcast[:time]
    @service = GifService.new
    @url = find_gif
  end 

  def find_gif 
    @service.gif_from_summary(@summary)
  end 
end 