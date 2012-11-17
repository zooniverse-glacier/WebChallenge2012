class UploadsController < ApplicationController
  respond_to :html, :json
  
  def index
    
  end
  
  def new
    
  end
  
  def create
    cloud_image = Cloudinary::Uploader.upload(params[:upload][:image])
    
    render :text => cloud_image
  end
end
