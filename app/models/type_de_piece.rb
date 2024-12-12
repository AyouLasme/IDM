class TypeDePiece < ApplicationRecord
    has_many :pieces, dependent: :destroy

  # Validation pour s'assurer que le champ libellé est unique et présent
  validates :libelle, presence: true, uniqueness: true

    def to_s
      libelle
    end
end
