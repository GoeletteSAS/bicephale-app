class Coaching < ApplicationRecord
  belongs_to :first_coaching, class_name: "Coaching"
  belongs_to :first_month_coaching, class_name: "Coaching"
  belongs_to :second_month_coaching, class_name: "Coaching"
  belongs_to :third_month_coaching, class_name: "Coaching"
end
