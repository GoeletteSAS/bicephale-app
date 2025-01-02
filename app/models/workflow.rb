class Workflow < ApplicationRecord
  belongs_to :first_coaching_id
  belongs_to :first_month_coaching_id
  belongs_to :second_month_coaching_id
  belongs_to :third_month_coaching_id
end
