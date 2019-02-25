class GifService
  attr_reader :conn
  def initialize
    @conn = Faraday.new(url: "https://api.giphy.com") do |c|
      c.request :url_encoded
      c.response :json, parser_options: {symbolize_names: true}
      c.adapter Faraday.default_adapter
    end
  end 

  def gif_from_summary(string)
    conn.get do |req|
      req.url "/v1/gifs/translate"
      req.params["api_key"] = ENV["GIPHY_KEY"]
      req.params["s"] = string
    end.body[:data][:url]
  end 
end