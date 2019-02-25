require "rails_helper"

describe "Favorites" do
  context "create" do 
    it "can be created", :vcr do 
      user = User.create(email: "email", password: "password", token: "1234")
      params = {location: "Denver, CO", api_key: "1234"}
      post api_v1_favorites_path(params)
      
      favorite = Favorite.find_by(api_key: 1234)

      expect(favorite).to be_truthy
      expect(response.status).to eq(200)
    end 

    it "can't be created without an accurate api_key", :vcr do 
      params = {location: "Denver, CO", token: 1234 }
      post api_v1_favorites_path(params)
      
      favorite = Favorite.find_by(api_key: 1234)

      expect(favorite).to be_falsy
      expect(response.status).to eq(401)
    end
  end

  context "read" do 
    it 'can be read with a good api key', :vcr do 
      user = User.create(email: "email", password: "password", token: "1234")
      params = {location: "Denver, CO", api_key: "1234"}
      Favorite.create(params)

      request_params = {"api_key": "1234"}
      get api_v1_favorites_path(request_params)

      expect(response.status).to eq(200)
    end 

    it 'cant be read with a bad api key' do 
      params = {location: "Denver, CO", api_key: "1234"}
      Favorite.create(params)

      request_params = {"api_key": "jgn983hy48thw9begh98h4539h4"}
      get api_v1_favorites_path(request_params)

      expect(response.status).to eq(401)
    end 
  end

  context "delete" do 
    xit "can delete an endpoint" do 
      params = {location: "Denver, CO", api_key: "1234"}
      Favorite.create(params)

      request_params = {"api_key": "jgn983hy48thw9begh98h4539h4",
                        "location": "Denver, CO"}

      delete api_v1_favorites_path(request_params)

      require 'pry'; binding.pry
    end 
  end 
end
 