class Piece < ApplicationRecord
  belongs_to :residence
  has_many :reservations

   # Ajouter des validations ici
   validates :description, :capacite, :type_de_piece, presence: true
   validates :capacite, numericality: { greater_than: 0 }
end

