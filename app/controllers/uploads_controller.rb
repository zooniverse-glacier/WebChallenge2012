class UploadsController < ApplicationController
  respond_to :html, :json
  
  def index
    @uploads = Upload.all
  end
  
  def new
    @upload = Upload.new
  end
  
  def create
    upload = Upload.new(params[:upload])
    upload.image = params[:upload][:image]
    upload.save
    
    redirect_to upload_path(upload)
  end
  
  def show
    @upload = Upload.find(params[:id])
    
  end
end
