module StandardsHelper
  def students_list
    User.where(role: "student").select{|user| user.custom_attr.first["student_standard"] == @standard.class_room}
  end
end

