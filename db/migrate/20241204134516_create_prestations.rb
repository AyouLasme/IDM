class CreatePrestations < ActiveRecord::Migration[8.0]
  def change
    create_table :prestations do |t|
      t.string :libelle
      t.text :description
      t.references :residence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
