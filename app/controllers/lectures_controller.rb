class LecturesController < ApplicationController
  before_action :set_classroom
  def index
    @lectures = @class_room.lectures.all
  end

  def show
    @lecture = @class_room.lectures.find(params[:id])
  end

  def new
    @lecture = @class_room.lectures.new
  end

  def edit
    @lecture = @class_room.lectures.find(params[:id])
  end

  def create
    @lecture = @class_room.lectures.create(lecture_params)
    if @lecture.save
    redirect_to school_class_room_lectures_path(@class_room)
    else 
      render :new
    end
  end

  def update
    @lecture = @class_room.lectures.find(params[:id])
    if @lecture.update(lecture_params)
      redirect_to  school_class_room_lectures_path(@class_room)
    else
      redirect_to  edit_class_room_lecture_path(@class_room)
    end
  end

  private

  def lecture_params
    params.require(:lecture).permit(:title, :description, :time, :duration, :subject_code, :date, :class_room_id)
  end

  def set_classroom
    @class_room = ClassRoom.find_by(id: params[:class_room_id])
  end
end
