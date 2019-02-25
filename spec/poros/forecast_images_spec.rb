require "rails_helper"

describe "Forcast Images" do
  it 'has attributes', :vcr do 
    forecast = Forecast.new("denver,co").predict[:daily][:data]
    fi = ForecastImages.new(forecast)

    expect(fi.images).to be_an(Array)
    expect(fi.images.first).to be_a(GifFacade)
  end 
end
