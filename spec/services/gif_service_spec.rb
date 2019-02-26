require "rails_helper"

describe "Gif Service" do
  it "can generate a gif url from a string", :vcr do 
    service = GifService.new
    testing123 = "Mostly sunny in the morning"
    expected = service.gif_from_summary(testing123)

    expect(expected).to include("https") 
  end 
end
