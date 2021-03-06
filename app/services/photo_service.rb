class PhotoService
  attr_reader :conn
  def initialize(coord)
    @lat = coord[0]
    @long = coord[1]
    @conn = Faraday.new(url: "https://api.flickr.com") do |c|
      c.request :url_encoded
      c.response :xml
      c.adapter Faraday.default_adapter
    end 
  end
  
  def find_photo
    conn.get do |req|
      req.url("/services/rest/")
      req.params["api_key"] = ENV['FLICKER_KEY']
      req.params["method"] = "flickr.photos.search"
      req.params["lat"] = @lat
      req.params["lon"] = @long
      req.params["sort"] = "interestingness-desc"
      req.params["extras"] = "o_dims"
      req.params["accuracy"] = 11
    end.body["rsp"]["photos"]["photo"][0]
  end

  def generate_img_link
    response = find_photo
    farm_id = response["farm"]
    server_id = response["server"]
    id = response["id"]
    secret = response["secret"]
    "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"
  end 
end