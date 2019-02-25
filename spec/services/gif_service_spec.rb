require "rails_helper"

describe "Gif Service" do
  it "can generate a gif from a string" do 
    service = GifService.new
    testing123 = "Mostly sunny in the morning"
    expected = service.from_summary(testing123)


    require 'pry'; binding.pry
    expect(expected.status).to eq(200) 
  end 
end
