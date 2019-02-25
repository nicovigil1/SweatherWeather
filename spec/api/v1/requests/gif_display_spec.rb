require "rails_helper"

describe "Giphy can be displayed" do
  it 'can get a list of giphy objects', :vcr do
    get "/api/v1/gifs?location=denver,co"

    require 'pry'; binding.pry
  end 
end
