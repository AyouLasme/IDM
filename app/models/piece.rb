class Piece < ApplicationRecord
  belongs_to :residence
  has_many :reservations
  has_many :tarifs, dependent: :destroy
  belongs_to :type_de_piece
  has_many :disponibilites, dependent: :destroy

  has_many_attached :images

   # Ajouter des validations ici
   validates :description, :capacite, :type_de_piece, presence: true
   validates :capacite, numericality: { greater_than: 0 }
end

