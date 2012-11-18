class SchoolsController < ApplicationController
  respond_to :html
  respond_to :json, only: [:index, :show, :order]
  before_filter :login_required, only: [:new, :create, :edit, :update, :destroy, :order]
  
  def index
    respond_to do |format|
      format.html{ @schools = School.order('position asc').all }
      format.json{ respond_with School.for_json.all, include: :events, methods: [:image_url], callback: params[:callback] }
    end
  end
  
  def show
    respond_to do |format|
      format.html{ @school = School.where('slug = ?', params[:id]).first }
      format.json{ respond_with School.for_json.where('slug = ?', params[:id]).first, include: :events, methods: [:image_url], callback: params[:callback] }
    end
  end
  
  def new
    @school = School.new
    @school.events.build
    @uploads = Upload.limit(10).order('created_at desc')
  end
  
  def order
    params[:orders].each_pair do |key, val|
      School.find(key.to_i).update_attribute :position, val.to_i
    end
    
    render json: { }, status: 200
  end
  
  def create
    @school = School.new(params[:school])
    if @school.save
      redirect_to @school, :notice => "Successfully created school."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @school = School.where('slug = ?', params[:id]).first
    @uploads = Upload.limit(10).order('created_at desc')
  end
  
  def update
    @school = School.where('slug = ?', params[:id]).first
    if @school.update_attributes(params[:school])
      redirect_to @school, :notice  => "Successfully updated school."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @school = School.where('slug = ?', params[:id]).first
    @school.destroy
    redirect_to schools_url, :notice => "Successfully destroyed school."
  end
end
