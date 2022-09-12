class ClassRoomsController < ApplicationController
  before_action :set_school
  def index
    @class_rooms = @school.class_rooms.all
  end

  def show
    @class_room = ClassRoom.find(params[:id])
  end

  def new
    @class_room = @school.class_rooms.new
  end

  def edit
    @class_room = @school.class_rooms.find(params[:id])
  end

  def create
    @class_room = @school.class_rooms.create(class_room_params)
    if @class_room.save
    redirect_to school_class_room_path(@school)
    else 
      render :new
    end
  end

  def update
    @class_room = @school.class_rooms.find(params[:id])

    if @class_room.update(class_room_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def class_room_params
    params.require(:class_room).permit(:standard, :school_id)
  end

  def set_school
    @school = School.first
  end
end
