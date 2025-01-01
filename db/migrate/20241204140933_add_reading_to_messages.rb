class AddReadingToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :reading, :boolean, default: false
  end
end
