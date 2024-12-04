class CreateTypeDePieces < ActiveRecord::Migration[8.0]
  def change
    create_table :type_de_pieces do |t|
      t.string :libelle

      t.timestamps
    end
  end
end
