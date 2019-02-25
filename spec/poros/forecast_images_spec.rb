require "rails_helper"

describe "Forcast Images" do
  it 'has attributes', :vcr do 
    fi = ForecastImages.new("denver,co")

    expect(fi.images).to be_an(Array)
    expect(fi.images.first).to be_a(GifFacade)
  end 
end
