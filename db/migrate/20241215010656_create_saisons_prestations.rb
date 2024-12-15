class CreateSaisonsPrestations < ActiveRecord::Migration[8.0]
  def change
    create_table :saisons_prestations do |t|
      t.references :saison, null: false, foreign_key: true
      t.references :prestation, null: false, foreign_key: true
      t.decimal :prix, precision: 10, scale: 2, null: false, default: 0.0

      t.timestamps
    end

    add_index :saisons_prestations, [:saison_id, :prestation_id], unique: true
  end
end
