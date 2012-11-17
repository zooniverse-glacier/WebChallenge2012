class UniversitiesController < ApplicationController
  before_filter :login_required, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @universities = University.all
  end
  
  def show
    @university = University.find(params[:id])
  end
  
  def new
    @university = University.new
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
    @university = University.find(params[:id])
  end
  
  def update
    @university = University.find(params[:id])
    if @university.update_attributes(params[:university])
      redirect_to @university, :notice  => "Successfully updated university."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    login_required
    @university = University.find(params[:id])
    @university.destroy
    redirect_to universities_url, :notice => "Successfully destroyed university."
  end
end
