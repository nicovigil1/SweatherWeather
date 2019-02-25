require 'rails_helper'

describe "Users" do
  it 'can register with correct credentials' do 
    params = {
      email: "example@example.com",
      password: "password",
      confirm_password: "password"
    }

    post api_v1_users_path(params) 
    
    expect(response.status).to eq(201)
    expect(User.all.length).to eq(1)
  end 

  it 'cant register with bad credentials' do 
    params = {
      username: "example@example.com",
      password: "password",
      confirm_password: "passsdfword"
    }
    post api_v1_users_path(params) 

    expect(response.status).to eq(401)
    expect(User.all.length).to eq(0)
  end
end
