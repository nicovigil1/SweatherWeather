require "rails_helper"

describe "Giphy can be displayed" do
  it 'can get a list of giphy objects', :vcr do
    get "/api/v1/gifs?location=denver,co"

    expected = JSON.parse(response.body)

    expect(expected["data"]["attributes"]["image"]).to be_truthy 
  end 
  it 'cant get a list of giphy objects without location', :vcr do
    get "/api/v1/gifs"

    expected = JSON.parse(response.body)

    expect(expected["error"]).to be_truthy 
  end 
end
