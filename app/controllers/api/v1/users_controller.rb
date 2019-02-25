class Api::V1::UsersController < ApplicationController
  def create
    if passwords_match
      user = User.create(user_params)
      render json: {key: user.generate_key}, status: 201
    else
      render json: {error: "try again"}, status: 401
    end 
  end 
  
  def passwords_match
    params[:password] == params[:confirm_password]
  end 
  
  def user_params
    params.permit(:password, :email)
  end
end