class Disponibilite < ApplicationRecord
  belongs_to :piece

  # Validations
  validates :date_debut, :date_fin, presence: true
  validate :valid_date_range

  private

  def valid_date_range
    if date_debut.present? && date_fin.present? && date_debut > date_fin
      errors.add(:date_debut, "doit être avant la date de fin")
    end
  end
end

