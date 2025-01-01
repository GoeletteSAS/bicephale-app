class Favorite < ApplicationRecord
  belongs_to :user_1, class_name: "User", foreign_key: :user_1_id
  belongs_to :user_2, class_name: "User", foreign_key: :user_2_id
  validates :user_2_id, uniqueness: { scope: :user_1_id, message: "est déjà dans vos favoris" }
end
