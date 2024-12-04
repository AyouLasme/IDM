class CreateTarifs < ActiveRecord::Migration[8.0]
  def change
    create_table :tarifs do |t|
      t.decimal :prix
      t.references :saison, null: false, foreign_key: true
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
