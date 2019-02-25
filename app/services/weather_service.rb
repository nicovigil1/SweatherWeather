class WeatherService 
  attr_reader :conn
  def initialize(coords)
    @lat_lon = coords.join(",")
    @conn = Faraday.new(url: "https://api.darksky.net") do |c|
      c.request :url_encoded
      c.response :json, parser_options: { symbolize_names: true }
      c.adapter Faraday.default_adapter
    end 
  end 

  def weather
    conn.get do |req|
      req.url "/forecast/#{ENV['DARK_KEY']}/#{@lat_lon}"
    end.body
  end
end