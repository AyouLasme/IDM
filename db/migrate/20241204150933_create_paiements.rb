class CreatePaiements < ActiveRecord::Migration[8.0]
  def change
    create_table :paiements do |t|
      t.decimal :montant
      t.datetime :date_paie
      t.string :mode_paie
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
