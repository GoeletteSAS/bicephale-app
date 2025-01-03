class RenameChatroomToBinome < ActiveRecord::Migration[7.1]
  def change
    # Renommer la table chatrooms en binomes
    rename_table :chatrooms, :binomes

    # Vérifier si la colonne chatroom_id existe et la renommer en binome_id
    if column_exists?(:messages, :chatroom_id)
      rename_column :messages, :chatroom_id, :binome_id
    end

    # Supprimer l'index existant sur chatroom_id si il existe
    if index_exists?(:messages, :chatroom_id)
      remove_index :messages, :chatroom_id
    end

    # Supprimer l'index existant sur binome_id si il existe déjà
    if index_exists?(:messages, :binome_id)
      remove_index :messages, :binome_id
    end

    # Ajouter l'index pour la nouvelle colonne binome_id
    add_index :messages, :binome_id

    # Supprimer l'ancienne clé étrangère sur chatrooms
    if foreign_key_exists?(:messages, :chatrooms)
      remove_foreign_key :messages, :chatrooms
    end

    # Ajouter la nouvelle clé étrangère sur binomes
    add_foreign_key :messages, :binomes, column: :binome_id
  end
end
