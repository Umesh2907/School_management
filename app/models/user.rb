class User < ApplicationRecord
  has_one_attached :avatar
  has_many :attendances
  has_many :feedbacks
  has_many :lectures
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :principal, :teacher, :student]

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "40x40!").processed 
    else
      "default_avatar.jpg"
    end
  end
end
