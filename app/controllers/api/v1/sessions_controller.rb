class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: {key: user.token}, status: 200
    else
      render json: {error: "try again"}, status: 401
    end 
  end 
end 