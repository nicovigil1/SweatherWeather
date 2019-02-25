class GifSerializer
  include FastJsonapi::ObjectSerializer
  attribute :image do |image|
    image.images
  end 
end
