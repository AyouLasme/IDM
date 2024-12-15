class Reservation < ApplicationRecord
  has_many :paiements, dependent: :destroy
  belongs_to :user
  belongs_to :piece, optional: true
  belongs_to :residence, optional: true

  before_save :calculer_montant_global

  # Méthode pour renvoyer un montant formaté
  def montant_formaté
    montant_global.present? ? "#{montant_global} €" : "Montant indisponible"
  end

  private

  def calculer_montant_global
    return unless date_debut && date_fin

    nombre_de_jours = (date_fin.to_date - date_debut.to_date).to_i + 1
    saison = Saison.where("debut_saison <= ? AND fin_saison >= ?", date_debut, date_debut).first

    if saison
      if piece.present?
        saison_piece = SaisonsPiece.find_by(saison: saison, piece: piece)
        self.montant_global = saison_piece ? (saison_piece.prix * nombre_de_jours) : 0
      elsif residence.present?
        saison_residence = ResidencesSaison.find_by(saison: saison, residence: residence)
        self.montant_global = saison_residence ? (saison_residence.prix * nombre_de_jours) : 0
      else
        self.montant_global = 0
      end
    else
      self.montant_global = 0
    end
  end
end
