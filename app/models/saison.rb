class Saison < ApplicationRecord
    has_many :tarifs, dependent: :destroy
  
    # Validations
    validates :libelle, presence: true, uniqueness: true
    validates :debut_saison, :fin_saison, presence: true
    validate :valid_date_range
  
    private
  
    def valid_date_range
      if debut_saison.present? && fin_saison.present? && debut_saison > fin_saison
        errors.add(:debut_saison, "doit être avant la date de fin")
      end
    end
  end
  