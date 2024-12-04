class CreateResidences < ActiveRecord::Migration[8.0]
  def change
    create_table :residences do |t|
      t.string :nom_de_la_residence
      t.text :adresse
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
