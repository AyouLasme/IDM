class ResidencesSaison < ApplicationRecord
  belongs_to :residence
  belongs_to :saison

  validates :prix, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
