class User < ApplicationRecord
  has_one_attached :avatar
  has_many :attendances
  has_many :feedbacks
  belongs_to :school
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  serialize :custom_attr

  enum role: [:admin, :principal, :teacher, :student]

  # def user_custom_attr
  #   number = 1
  #   current_roll_number = []
  #   if current_user.role == "student"
  #     custom_attr.each do |key, value|
  #       roll_no = number + 1
  #       current_roll_number.push(roll_no)
  #     end
  #   end
  # end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "40x40!").processed 
    else
      "default_avatar.jpg"
    end
  end
end
