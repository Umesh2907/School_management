# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :set_school

  # GET /resource/sign_up
  def new
    @user = @school.users.new
  end

  def show
    @user = User.find(params[:id])
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    if @user.save
      @user.set_standard_and_roll_no(user_params[:student_standard], user_params[:roll_no])
      redirect_to root_path
    else
      render 'new'
    end
  end

  # GET /resource/edit
  def edit
    @user = current_user
  end

  # PUT /resource
  def update
    @user = @school.users.find(params[:id])
    if @user.update(user_params)
      @user.set_standard_and_roll_no(user_params[:student_standard], user_params[:roll_no])
      redirect_to school_users_path
    else
      render 'edit'
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # private

  def set_school
    @school = School.first
  end

  def user_params
    params.require(:user).permit(:email, :school_id, :first_name, :last_name, :date_of_birth, :gender, :contact_number, :address, :role, :password, :password_confirmation, :student_standard, :roll_no, :custom_attr)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:school_id, :first_name, :last_name, :date_of_birth, :gender, :contact_number, :address, :role, :standard, :roll_no])
  # end

  # # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :school_id, :first_name, :last_name, :date_of_birth, :gender, :contact_number, :address, :role, :student_standard, :roll_no, :custom_attr, :current_password])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
