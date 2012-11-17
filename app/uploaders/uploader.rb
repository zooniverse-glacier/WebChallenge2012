class Uploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
  version :carousel do
    process :resize_to_fit => [1040, 350]
  end
  
  version :large do
    process, :resize_to_fit => [490, 350]
  end
  
  version :school do
    process, :resize_to_fit => [235, 175]
  end
  
  version :thumbnail do
    process :resize_to_fit => [50, 50]
  end
end

