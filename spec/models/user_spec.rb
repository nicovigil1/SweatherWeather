require 'rails_helper'

RSpec.describe User, type: :model do
  it "can update a users' token" do 
    user = User.create(email: "email", password: "password")

    user.generate_key
    user.reload

    expect(user.token).to be_truthy
  end 
end
