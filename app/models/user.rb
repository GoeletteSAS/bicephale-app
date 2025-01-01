class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :experiences, dependent: :destroy
  has_many :searches, dependent: :destroy
  # has_many :favorites_as_user_1, class_name: "Favorite", foreign_key: :user_1_id
  has_many :favorites, foreign_key: :user_1_id
  has_many :favorite_users, through: :favorites, source: :user_2
  has_one_attached :photo, dependent: :destroy
  has_many :chatrooms_as_user_1, class_name: "Chatroom", foreign_key: :user_1_id
  has_many :chatrooms_as_user_2, class_name: "Chatroom", foreign_key: :user_2_id

  def current_experience
    experiences.find_by(is_current: true)
  end

  def chatrooms
    Chatroom.where('user_1_id = :user_id OR user_2_id = :user_id', user_id: id)
  end
end
