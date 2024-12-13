class ChangeDebutFinSaisonToInteger < ActiveRecord::Migration[8.0]
  def up
    # Supprimez les anciennes colonnes
    remove_column :saisons, :debut_saison, :date
    remove_column :saisons, :fin_saison, :date

    # Ajoutez de nouvelles colonnes de type integer
    add_column :saisons, :debut_saison, :integer
    add_column :saisons, :fin_saison, :integer
  end

  def down
    # Revenir à l'état initial (ajouter les colonnes `date` à la place des entiers)
    remove_column :saisons, :debut_saison, :integer
    remove_column :saisons, :fin_saison, :integer

    add_column :saisons, :debut_saison, :date
    add_column :saisons, :fin_saison, :date
  end
end
