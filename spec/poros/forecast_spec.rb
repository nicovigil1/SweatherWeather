require "rails_helper"
 

describe "Forecast" do
  it "Can hold services and display a forcast", :vcr do
    forecast = Forecast.new("denver,co")

    expect(forecast.predict).to be_a(Hash)
  end
end
