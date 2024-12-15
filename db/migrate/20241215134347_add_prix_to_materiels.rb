class AddPrixToMateriels < ActiveRecord::Migration[8.0]
  def change
    add_column :materiels, :prix, :decimal, precision: 10, scale: 2
  end
end
