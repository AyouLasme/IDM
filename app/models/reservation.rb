class Reservation < ApplicationRecord
  has_many :paiements, dependent: :destroy
  belongs_to :user
  belongs_to :piece, optional: true
  belongs_to :residence, optional: true

  before_save :calculer_montant_global

  # Méthode pour calculer le montant par jour
  def montant_par_jour
    return 0 unless date_debut.present? && (piece.present? || residence.present?)

    # Trouver la saison correspondant à la date de début
    saison = Saison.where("debut_saison <= ? AND fin_saison >= ?", date_debut, date_debut).first

    if saison
      if piece.present?
        saison_piece = SaisonsPiece.find_by(saison: saison, piece: piece)
        return saison_piece&.prix || 0
      elsif residence.present?
        saison_residence = ResidencesSaison.find_by(saison: saison, residence: residence)
        return saison_residence&.prix || 0
      end
    end

    0 # Retourne 0 si aucun tarif trouvé
  end

  # Méthode pour calculer le montant global
  def calculer_montant_global
    return unless date_debut && date_fin

    nombre_de_jours = (date_fin.to_date - date_debut.to_date).to_i + 1
    self.montant_global = montant_par_jour * nombre_de_jours
  end
end

