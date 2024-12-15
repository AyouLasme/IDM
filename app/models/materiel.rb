class Materiel < ApplicationRecord
  belongs_to :residence
  has_many :saisons_materiels
  has_many :saisons, through: :saisons_materiels

  validates :nom, :description, :quantites_disponible, presence: true
  validates :quantites_disponible, numericality: { greater_than_or_equal_to: 0 }

end
