require "rails_helper"

describe "Forecast" do
  it 'can receive a forecast', :vcr do 
    get "/api/v1/forecast?location=denver,co"

    expected = JSON.parse(response.body)

    expect(expected["data"]["id"]).to eq("1")
  end 
end