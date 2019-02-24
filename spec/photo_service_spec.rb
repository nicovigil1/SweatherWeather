require "rails_helper"

describe "Photo Service" do
  it 'can connect to flicker and respond with an image', :vcr do 
    lat_long = [39.74000930786133, -104.99201965332031]
    service = PhotoService.new(lat_long)
    expected = service.find_photo

    expect(expected["rsp"]).to be_truthy
  end 
end
