class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.datetime :date_debut
      t.datetime :date_fin
      t.string :statut
      t.decimal :montant_global
      t.references :user, null: false, foreign_key: true
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
