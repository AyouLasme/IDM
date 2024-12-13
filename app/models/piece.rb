class Piece < ApplicationRecord
  has_many_attached :images
  belongs_to :residence
  has_many :reservations
  has_many :tarifs, dependent: :destroy
  belongs_to :type_de_piece
  has_many :disponibilites, as: :reservable, dependent: :destroy

   # Ajouter des validations ici
   validates :description, :capacite, :type_de_piece, presence: true
   validates :capacite, numericality: { greater_than: 0 }

  def to_s
    description
  end
end

