class SchoolsController < ApplicationController
  before_action :set_sidebar
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def edit
    @school = School.find(params[:id])
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to @school
    else
      render 'new'
    end
  end

  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      redirect_to @school
    else
      render 'edit'
    end
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy

    redirect_to schools_path
  end
  
  private

  def set_sidebar
    @show_sidebar = true
  end
  
  def school_params
    params.require(:school).permit(:name, :email, :address, :contacts)
  end
end
