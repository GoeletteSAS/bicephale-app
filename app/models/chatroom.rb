class Chatroom < ApplicationRecord
  belongs_to :user_1, class_name: "User", foreign_key: :user_1_id
  belongs_to :user_2, class_name: "User", foreign_key: :user_2_id
  has_many :messages, dependent: :destroy

  validates :user_1_id, uniqueness: { scope: :user_2_id, message: "Chatroom already exists between these users" }

  def participants
    [user_1, user_2]
  end

  def other_user(current_user)
    current_user == user_1 ? user_2 : user_1
  end

  # def self.ordered_by_last_message
  #   left_joins(:messages)
  #     .group(:id)
  #     .order('MAX(messages.created_at) DESC NULLS LAST')
  # end
end
