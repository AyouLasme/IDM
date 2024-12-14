class ChangeReservableIdNullInDisponibilites < ActiveRecord::Migration[8.0]
  def change
    add_reference :disponibilites, :reservable, polymorphic: true, null: false
  end
end
