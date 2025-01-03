class ChangeForeignKeysToIntegerInWorkflows < ActiveRecord::Migration[7.1]
  def change
    # Changer les colonnes existantes de bigint à integer
    change_column :workflows, :binome_id, :integer
    change_column :workflows, :first_coaching_id, :integer
    change_column :workflows, :first_month_coaching_id, :integer
    change_column :workflows, :second_month_coaching_id, :integer
    change_column :workflows, :third_month_coaching_id, :integer
  end
end
