class UsersController < ApplicationController
  before_action :set_school

  def index
    @users = User.where(role: "student")
  end

  # def edit
  #   @user = @school.users.find(params[:id])
  # end

  def edit
    @user = @school.users.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:school_id, :first_name, :last_name, :date_of_birth, :gender, :contact_number, :address, :role, :custom_attr)
  end

  def set_school
    @school = School.first
  end

end
