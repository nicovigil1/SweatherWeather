require "rails_helper"

describe "Gif Facade" do
  it 'has attributes', :vcr do 
    data = {summary: "stuff happens probably", time:"10 min late"}
    gif = GifFacade.new(data)

    expect(gif.time).to eq("10 min late")
    expect(gif.summary).to eq("stuff happens probably")
    expect(gif.url).to include("http")
  end 
end
