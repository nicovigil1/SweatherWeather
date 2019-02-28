require "rails_helper"

describe "Photo Facade" do
  it "can generate a photo link", :vcr do
      lat_long = ["39.74000930786133", "-104.99201965332031"]
      expect(PhotoFacade.gen_photo(lat_long)[:photo]).to include("http") 
  end 
end