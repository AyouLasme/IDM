class Prestation < ApplicationRecord
  belongs_to :residence
  has_many :saisons_prestations
  has_many :saisons, through: :saisons_prestations

    # Validations
    validates :libelle, :description, presence: true
    validates :libelle, uniqueness: { scope: :residence_id, message: "existe déjà pour cette résidence" }
end
