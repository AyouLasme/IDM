class Saison < ApplicationRecord
  # Validations
  validates :libelle, presence: true, uniqueness: true
  validates :debut_saison, :fin_saison, presence: true
  validates :debut_saison, :fin_saison, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validate :valid_month_range

  private

  def valid_month_range
    if debut_saison.present? && fin_saison.present? && debut_saison > fin_saison
      errors.add(:debut_saison, "doit être avant ou égal au mois de fin")
    end
  end
end
