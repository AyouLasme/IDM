class AddReservableToDisponibilites < ActiveRecord::Migration[8.0]
  def change
    add_column :disponibilites, :reservable_type, :string
    add_column :disponibilites, :reservable_id, :integer
    add_index :disponibilites, :reservable_id
  end
end
