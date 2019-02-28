class PhotoFacade
  def self.gen_photo(lat_long)
    service = PhotoService.new(lat_long)
    {photo: service.generate_img_link}
  end
end