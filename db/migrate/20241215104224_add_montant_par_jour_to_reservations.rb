class AddMontantParJourToReservations < ActiveRecord::Migration[8.0]
  def change
    add_column :reservations, :montant_par_jour, :decimal
  end
end
