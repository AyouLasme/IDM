class Prestation < ApplicationRecord
  belongs_to :residence

    # Validations
    validates :libelle, :description, presence: true
    validates :libelle, uniqueness: { scope: :residence_id, message: "existe déjà pour cette résidence" }
end
