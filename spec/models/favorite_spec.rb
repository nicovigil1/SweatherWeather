require "rails_helper"

describe "Favorite" do
  it "can find a user's favorites", :vcr do
    user = User.create!(email: "email", password: "password", token: "1234")
    params1 = {location: "Denver, CO", api_key: "1234"}
    Favorite.create!(params1)
    params2 = {location: "Wichita, KS", api_key: "1234"}
    Favorite.create!(params2)

    expect(Favorite.show_favorites(user.token).length).to eq(2)
  end 
end
