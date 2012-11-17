class Upload < ActiveRecord::Base
  mount_uploader :image, Uploader
  attr_accessible :image_cache, :image, :description
end