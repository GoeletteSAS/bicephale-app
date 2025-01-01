class AddTimeshareToSearches < ActiveRecord::Migration[7.1]
  def change
    add_column :searches, :timeshare, :integer
  end
end
