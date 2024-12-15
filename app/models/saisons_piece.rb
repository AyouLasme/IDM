class SaisonsPiece < ApplicationRecord
  belongs_to :saison
  belongs_to :piece

  validates :prix, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
