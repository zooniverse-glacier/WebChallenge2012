class UniversitiesController < ApplicationController
  respond_to :html
  respond_to :json, only: [:index, :show]
  before_filter :login_required, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    respond_to do |format|
      format.html{ @universities = University.all }
      format.json{ respond_with University.for_json.all, callback: params[:callback] }
    end
  end
  
  def show
    respond_to do |format|
      format.html{ @university = University.where('slug = ?', params[:id]).first }
      format.json{ respond_with University.for_json.where('slug = ?', params[:id]).first, callback: params[:callback] }
    end
  end
  
  def new
    @university = University.new
    respond_with @university
  end
  
  def create
    @university = University.new(params[:university])
    if @university.save
      redirect_to @university, :notice => "Successfully created university."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @university = University.where('slug = ?', params[:id]).first
    respond_with @university
  end
  
  def update
    @university = University.where('slug = ?', params[:id]).first
    if @university.update_attributes(params[:university])
      redirect_to @university, :notice  => "Successfully updated university."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @university = University.where('slug = ?', params[:id]).first
    @university.destroy
    redirect_to universities_url, :notice => "Successfully destroyed university."
  end
end
