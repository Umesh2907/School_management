class AttendancesController < ApplicationController
  before_action :set_user
    def index
      @attendances = @user.attendances.all
    end
  
    def show
      @attendance = @user.attendances.find(params[:id])
    end
  
    def new
      @attendance = @user.attendances.new
    end
  
    def edit
      @attendance = @user.attendances.find(params[:id])
    end
  
    def create
      @attendance = @user.attendances.create(attendace_params)
      if @attendance.save
      redirect_to user_attendances_path(@user)
      else 
        render :new
      end
    end
  
    def update
      @attendance = @user.attendances.find(params[:id])
      if @attendance.update(attendace_params)
        redirect_to user_attendances_path(@user)
      else
        redirect_to  edit_user_attendances_path(@user)
      end
    end
  
    private
  
    def attendace_params
      params.require(:attendance).permit(:date, :day, :attendance, :user_id)
    end
  
    def set_user
      @user = User.find(params[:user_id])
    end
end
