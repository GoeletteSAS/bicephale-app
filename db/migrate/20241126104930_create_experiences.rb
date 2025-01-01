class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :is_current
      t.string :line_of_work
      t.string :field
      t.string :address

      t.timestamps
    end
  end
end
