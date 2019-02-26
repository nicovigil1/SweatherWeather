require "rails_helper"
describe "Session Creation/Login" do
  it 'can register with good credentials' do 
    params = {
      email: "example@example.com",
      password: "password",
      token: 123
    }
    User.create(params)
    
    post api_v1_sessions_path(params) 

    expect(response.status).to eq(200)
  end 

  it 'can register with good credentials' do 
    params = {
      email: "example@example.com",
      password: "password",
    }
    
    post api_v1_sessions_path(params) 

    expect(response.status).to eq(401)
    expect(User.all.length).to eq(0)
  end 
end
  
