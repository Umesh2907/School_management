module SchoolsHelper
  def students_count
    User.where(role: "student").count
  end

  def teachers_count
    User.where(role: "teacher").count
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end
end
