class UpdateReservationsConstraints < ActiveRecord::Migration[8.0]
  def change
    change_column_null :reservations, :date_debut, false
    change_column_null :reservations, :date_fin, false
    change_column_null :reservations, :statut, false
    change_column_default :reservations, :statut, "Réservé"
    change_column :reservations, :montant_global, :decimal, precision: 10, scale: 2
  end
end
