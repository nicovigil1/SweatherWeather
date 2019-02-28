require "rails_helper"
describe "Session Creation/Login" do
  it 'can sign in with good credentials' do 
    params = {
      email: "example@example.com",
      password: "password",
      token: 123
    }
    
    User.create(params)
    
    post api_v1_sessions_path(params) 

    expect(response.status).to eq(200)
  end 

  it 'cant sign in with bad credentials' do 
    params = {
      email: "example@example.com",
      password: "password",
    }
    
    post api_v1_sessions_path(params) 

    expect(response.status).to eq(401)
    expect(User.all.length).to eq(0)
  end 

  it 'cant sign in twice' do 
    params = {
      email: "example@example.com",
      password: "password",
    }
    
    post api_v1_sessions_path(params) 
    
    expect(response.status).to eq(401)
    expect(User.all.length).to eq(0)
    
    post api_v1_sessions_path(params)
    expect(User.all.length).to eq(0)
  end 
end
  
