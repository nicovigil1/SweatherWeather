require 'rails_helper'

describe "WeatherService" do
    it "can receive a coord and return weather", :vcr do
      coords = [39.74000930786133, -104.99201965332031]
      service = WeatherService.new(coords)

      expected = service.weather

      expect(expected[:latitude]).to eq(39.74000930786133)
    end
end