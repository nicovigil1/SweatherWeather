require 'rails_helper'

describe "LocationService" do
  it "can be connected to & respond with coordinates", :vcr do
    service = LocationService.new

    expected = service.find_coord("Denver", "CO")

    expect(expected).to be_an(Array) 
    expect(expected.length).to eq(2) 
    expect(expected.first).to be_a(Float) 
  end
end
