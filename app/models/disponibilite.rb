class Disponibilite < ApplicationRecord
  belongs_to :reservable, polymorphic: true

  validates :date_debut, :date_fin, presence: true
  validate :date_range_is_valid
  validate :reservable_present_and_valid

  # Méthode pour retourner la description de la cible
  def cible
    case reservable_type
    when "Piece"
      reservable&.description || "Pièce introuvable"
    when "Residence"
      reservable&.nom_de_la_residence || "Résidence introuvable"
    else
      "Non spécifié"
    end
  end

  # Attribut virtuel pour traiter le champ combiné
  attr_accessor :reservable_id_and_type

  before_validation :assign_reservable_from_combined_field

  private

  # Validation des dates
  def date_range_is_valid
    if date_debut && date_fin && date_debut >= date_fin
      errors.add(:date_debut, "doit être avant la date de fin")
    end
  end

  # Vérifie que l'objet associé (Piece ou Residence) existe et est valide
  def reservable_present_and_valid
    if reservable.nil?
      errors.add(:reservable, "doit être une pièce ou une résidence valide")
    end
  end

  # Assigne le `reservable_type` et `reservable_id` à partir du champ combiné
  def assign_reservable_from_combined_field
    return if reservable_id_and_type.blank?

    type, id = reservable_id_and_type.split("-")
    self.reservable_type = type
    self.reservable_id = id
  end


end
