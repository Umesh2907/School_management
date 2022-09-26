class UsersController < ApplicationController
  before_action :set_school

  def index
    @users = User.where(role: "student")
  end

  # def new
  #   @user = User.new
  # end

  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.set_standard_and_roll_no(user_params[:standard], user_params[:roll_no])
      redirect_to school_users_path
    else
      render 'new'
    end
  end

  def edit
    @user = @school.users.find(params[:id])
  end

  def update
    @user = User.find(params[:id])    
    if @user.update(user_params)
      @user.set_standard_and_roll_no(user_params[:student_standard], user_params[:roll_no])
      redirect_to school_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = @school.users.find(params[:id])
    @user.destroy
    redirect_to school_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :school_id, :first_name, :last_name, :date_of_birth, :gender, :contact_number, :address, :role, :password, :password_confirmation, :student_standard, :roll_no, :custom_attr)
  end

  def set_school
    @school = School.first
  end

end
