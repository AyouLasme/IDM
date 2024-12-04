class CreateDisponibilites < ActiveRecord::Migration[8.0]
  def change
    create_table :disponibilites do |t|
      t.datetime :date_debut
      t.datetime :date_fin
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
