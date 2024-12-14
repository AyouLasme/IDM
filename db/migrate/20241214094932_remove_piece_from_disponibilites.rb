class RemovePieceFromDisponibilites < ActiveRecord::Migration[8.0]
  def change
    remove_column :disponibilites, :piece_id, :integer
  end
end
