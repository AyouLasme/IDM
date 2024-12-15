class SaisonsMateriel < ApplicationRecord
  self.table_name = "saisons_materiels"
  belongs_to :saison
  belongs_to :materiel

  validates :prix, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
