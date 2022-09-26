class StandardsController < ApplicationController
  before_action :set_school
  def index
    @standards = @school.standards
  end

  def show
    @standard = Standard.find(params[:id])
  end

  def new
    @standard = @school.standards.new
  end

  def edit
    @standard = @school.standards.find(params[:id])
  end

  def create
    @standard = @school.standards.create(standard_params)
    if @standard.save
    redirect_to school_standards_path(@school)
    else 
      render :new
    end
  end

  def update
    @standard = @school.standards.find(params[:id])

    if @standard.update(standard_params)
      redirect_to school_standards_path(@school)
    else
      render 'edit'
    end
  end

  private

  def standard_params
    params.require(:standard).permit(:standard, :school_id)
  end

  def set_school
    @school = School.first
  end
end
