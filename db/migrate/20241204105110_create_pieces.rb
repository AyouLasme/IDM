class CreatePieces < ActiveRecord::Migration[8.0]
  def change
    create_table :pieces do |t|
      t.text :description
      t.integer :capacite
      t.references :residence, null: false, foreign_key: true
      t.string :type_de_piece

      t.timestamps
    end
  end
end
