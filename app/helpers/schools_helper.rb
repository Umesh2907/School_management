module SchoolsHelper
  def students_count
    User.where(role: "student").count
  end

  def teachers_count
    User.where(role: "teacher").count
  end
  
end
