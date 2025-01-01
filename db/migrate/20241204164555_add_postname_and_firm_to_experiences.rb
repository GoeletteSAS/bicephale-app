class AddPostnameAndFirmToExperiences < ActiveRecord::Migration[7.1]
  def change
    add_column :experiences, :postname, :text
    add_column :experiences, :firm, :text
  end
end
