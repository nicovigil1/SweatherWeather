class User < ApplicationRecord
  has_secure_password

  def generate_key
    token = SecureRandom.uuid
    self.update(token: token)
    token 
  end 
end
