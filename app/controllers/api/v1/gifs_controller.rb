class Api::V1::GifsController < ApplicationController
  def index
    require 'pry'; binding.pry
    render json: GifSerializer.new()
  end 
end 
