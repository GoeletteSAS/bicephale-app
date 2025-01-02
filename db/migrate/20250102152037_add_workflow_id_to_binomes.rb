class AddWorkflowIdToBinomes < ActiveRecord::Migration[7.1]
  def change
    add_reference :binomes, :workflow, foreign_key: true
  end
end
