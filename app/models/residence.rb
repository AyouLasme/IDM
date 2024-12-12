class Residence < ApplicationRecord
    has_many_attached :images

    has_many :pieces, dependent: :destroy
    has_many :materiels, dependent: :destroy
    has_many :prestations, dependent: :destroy

    def to_s
        nom_de_la_residence
    end
end
