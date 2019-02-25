class LocationService 
  attr_reader :conn
  def initialize
    @conn = Faraday.new(url: "http://dev.virtualearth.net") do |conn|
      conn.request :url_encoded
      conn.response :json, parser_options: { symbolize_names: true }
      conn.adapter Faraday.default_adapter
    end
  end

  def find_coord(city, state)
    response = conn.get do |req| 
      req.url "/REST/v1/Locations/"
      req.params["countryRegion"] = "US"
      req.params["adminDistrict"] = state
      req.params["locality"] = city
      req.params["key"] = ENV["BING_KEY"]
    end
    sift_to_coordinates(response.body)
  end

  def sift_to_coordinates(hash)
    hash[:resourceSets][0][:resources][0][:geocodePoints][0][:coordinates]
  end
end 
  
