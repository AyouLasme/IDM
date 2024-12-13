class AddNomToPieces < ActiveRecord::Migration[8.0]
  def change
    add_column :pieces, :nom, :string
  end
end
