class User < ApplicationRecord
  has_one_attached :avatar
  belongs_to :school
  validate :one_principal_exists
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  serialize :custom_attr, Array
  attr_accessor :student_standard, :roll_no

  enum role: [:admin, :principal, :teacher, :student]

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "40x40!").processed 
    else
      "default_avatar.jpg"
    end
  end

  def set_standard_and_roll_no(standard, roll_no)
    self.update(custom_attr: [{"student_standard" => standard}, {"roll_no" => roll_no}])
  end

  private

  def one_principal_exists
    return unless principal?
    return unless User.where.not(id: id).exists?(role: 'principal')

    errors.add(:role, 'already exists')
  end

end
