class RemovePrixFromMateriels < ActiveRecord::Migration[8.0]
  def change
    remove_column :materiels, :prix, :decimal
  end
end
