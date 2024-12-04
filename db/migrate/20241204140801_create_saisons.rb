class CreateSaisons < ActiveRecord::Migration[8.0]
  def change
    create_table :saisons do |t|
      t.string :libelle
      t.date :debut_saison
      t.date :fin_saison

      t.timestamps
    end
  end
end
