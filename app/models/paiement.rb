class Paiement < ApplicationRecord
  belongs_to :reservation

  # Validations
  validates :montant, presence: true, numericality: { greater_than: 0 }
  validates :date_paie, presence: true
  validates :mode_paie, presence: true, inclusion: { in: %w[carte espece virement], message: "%{value} n'est pas un mode de paiement valide" }
end
