class AddQuotiteDeTravailToSearches < ActiveRecord::Migration[7.1]
  def change
    add_column :searches, :quotite_de_travail, :integer
  end
end
