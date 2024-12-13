class Paiement < ApplicationRecord
  belongs_to :reservation

  # Liste des modes de paiement valides
  MODES_PAIEMENT = %w[carte_bancaire especes cheque virement_bancaire].freeze

  # Validations
  validates :montant, presence: true, numericality: { greater_than: 0 }
  validates :date_paie, presence: true
  validates :mode_paie, presence: true, inclusion: { in: MODES_PAIEMENT, message: "%{value} n'est pas un mode de paiement valide" }
end
