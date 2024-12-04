class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :piece
  has_many :paiements, dependent: :destroy
end
