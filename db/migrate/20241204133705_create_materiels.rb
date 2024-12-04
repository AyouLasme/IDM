class CreateMateriels < ActiveRecord::Migration[8.0]
  def change
    create_table :materiels do |t|
      t.string :nom
      t.text :description
      t.integer :quantites_disponible
      t.references :residence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
