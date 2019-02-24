class PhotoService
  attr_reader :conn
  def initialize(coord)
    @lat = coord[0]
    @long = coord[1]
    @conn = Faraday.new(url: "https://api.flickr.com") do |c|
      c.request :url_encoded
      c.response :xml, parser_options: {symbolize_names: true}
      c.adapter Faraday.default_adapter
    end 
  end
  
  def find_photo
    conn.get do |req|
      req.url("/services/rest/")
      req.params["api_key"] = ENV['FLICKER_KEY']
      req.params["method"] = "flickr.places.findByLatLon"
      req.params["lat"] = @lat 
      req.params["lon"] = @long
      req.params["accuracy"] = 11 
    end.body
  end 
end