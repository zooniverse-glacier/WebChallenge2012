class Uploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
  version :standard do
    process :resize_to_fill => [600, 400, :north]
  end
  
  version :thumbnail do
    process :resize_to_fit => [50, 50]
  end
end