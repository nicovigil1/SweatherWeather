require "rails_helper"

describe "A Background Request" do
  it 'can be generated for a location', :vcr do 
    User.create(email: "email", password: "password", token: 1234)
    params = {coords: [39.74000930786133, -104.99201965332031], api_key: 1234 }
    
    get api_v1_backgrounds_path(params)

    parsed_response = JSON.parse(response.body)
    
    expect(parsed_response["photo"]).to include("http")
  end 

  it 'can be generated for a location', :vcr do 
    User.create(email: "email", password: "password", token: 123334)
    params = {coords: [39.74000930786133, -104.99201965332031], api_key: 1234 }
    
    get api_v1_backgrounds_path(params)

    parsed_response = JSON.parse(response.body)

    expect(parsed_response["error"]).to be_truthy
  end 
end
