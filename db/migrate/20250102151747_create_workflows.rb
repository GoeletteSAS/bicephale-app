class CreateWorkflows < ActiveRecord::Migration[7.1]
  def change
    create_table :workflows do |t|
      t.boolean :create_workspace
      t.boolean :first_quizz_done
      t.boolean :second_quizz_done
      t.boolean :third_quizz_done
      t.boolean :real_meeting_done
      t.boolean :company_validation
      t.references :first_coaching, foreign_key: { to_table: :coachings }
      t.boolean :first_coaching_done
      t.boolean :contract_prepared
      t.references :first_month_coaching, foreign_key: { to_table: :coachings }
      t.references :second_month_coaching, foreign_key: { to_table: :coachings }
      t.references :third_month_coaching, foreign_key: { to_table: :coachings }

      t.timestamps
    end
  end
end
