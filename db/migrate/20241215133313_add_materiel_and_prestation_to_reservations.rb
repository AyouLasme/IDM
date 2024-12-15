class AddMaterielAndPrestationToReservations < ActiveRecord::Migration[8.0]
  def change
    add_reference :reservations, :materiel, null: true, foreign_key: true
    add_reference :reservations, :prestation, null: true, foreign_key: true
  end
end
