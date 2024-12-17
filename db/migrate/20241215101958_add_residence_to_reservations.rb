class AddResidenceToReservations < ActiveRecord::Migration[8.0]
  def change
    add_reference :reservations, :residence, null: true, foreign_key: true
  end
end