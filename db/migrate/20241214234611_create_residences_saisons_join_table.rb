class CreateResidencesSaisonsJoinTable < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:residences_saisons)
      create_table :residences_saisons do |t|
        t.references :residence, null: false, foreign_key: true
        t.references :saison, null: false, foreign_key: true
        t.decimal :prix, precision: 10, scale: 2, null: false, default: 0.0
        t.timestamps
      end

      add_index :residences_saisons, [:residence_id, :saison_id], unique: true
    end
  end
end
