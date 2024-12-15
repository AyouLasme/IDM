class Residence < ApplicationRecord
    has_many_attached :images


    has_many :pieces, dependent: :destroy
    has_many :materiels, dependent: :destroy
    has_many :prestations, dependent: :destroy
    has_many :disponibilites, as: :reservable
    has_and_belongs_to_many :saisons
    has_many :residences_saisons
    has_many :saisons, through: :residences_saisons

    def to_s
        nom_de_la_residence || "Residence ##{id}"
    end
end

