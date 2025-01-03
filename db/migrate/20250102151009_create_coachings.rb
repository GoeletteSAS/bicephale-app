class CreateCoachings < ActiveRecord::Migration[7.1]
  def change
    create_table :coachings do |t|
      t.date :date
      t.string :adress
      t.boolean :done
      t.text :comment
      t.boolean :paid
      t.float :price

      t.timestamps
    end
  end
end
