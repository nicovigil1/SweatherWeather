require "rails_helper" 

describe "FavoriteFacade" do 
  it 'has attributes', :vcr do 
    fav_fac = FavoriteFacade.new("Denver, CO", 2)

    expect(fav_fac.location).to eq(["Denver", "CO"])
    expect(fav_fac.id).to eq(2)
    expect(fav_fac.current_weather).to be_truthy
  end 
end 