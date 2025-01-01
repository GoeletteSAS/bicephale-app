class CreateSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :searches do |t|
      t.references :user, null: false, foreign_key: true
      t.references :experience, null: false, foreign_key: true
      t.string :line_of_work
      t.string :field
      t.string :address
      t.boolean :is_offering

      t.timestamps
    end
  end
end
