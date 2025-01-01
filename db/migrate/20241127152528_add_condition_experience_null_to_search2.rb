class AddConditionExperienceNullToSearch2 < ActiveRecord::Migration[7.1]
  def change
    change_column :searches, :experience_id, :bigint, null: true
  end
end
