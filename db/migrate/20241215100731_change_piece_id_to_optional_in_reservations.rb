class ChangePieceIdToOptionalInReservations < ActiveRecord::Migration[8.0]
  def change
    change_column_null :reservations, :piece_id, true
  end
end
