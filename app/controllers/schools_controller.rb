class SchoolsController < ApplicationController
  respond_to :html
  respond_to :json, only: [:index, :show]
  before_filter :login_required, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    respond_to do |format|
      format.html{ @schools = School.all }
      format.json{ respond_with School.for_json.all, include: :projects }
    end
  end
  
  def show
    respond_to do |format|
      format.html{ @school = School.find(params[:id]) }
      format.json{ respond_with School.for_json.find(params[:id]), include: :projects }
    end
  end
  
  def new
    @school = School.new
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
    @school = School.find(params[:id])
  end
  
  def update
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      redirect_to @school, :notice  => "Successfully updated school."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @school = School.find(params[:id])
    @school.destroy
    redirect_to schools_url, :notice => "Successfully destroyed school."
  end
end
