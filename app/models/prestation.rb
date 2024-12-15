class Prestation < ApplicationRecord
  belongs_to :residence
  has_many :saisons_prestations
  has_many :saisons, through: :saisons_prestations
  has_many :reservations

    # Validations
    validates :libelle, :description, presence: true
    validates :libelle, uniqueness: { scope: :residence_id, message: "existe déjà pour cette résidence" }
  validates :prix, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
