class UpdateBinomeAndWorkflowAssociations < ActiveRecord::Migration[7.1]
  def change
    # Supprimer la clé `workflow_id` de la table `binomes`
    remove_column :binomes, :workflow_id, :bigint

    # Ajouter une clé `binome_id` à la table `workflows`
    add_reference :workflows, :binome, foreign_key: true
  end
end
