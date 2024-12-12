class Residence < ApplicationRecord
    has_one_attached :image

    has_many :pieces, dependent: :destroy
    has_many :materiels, dependent: :destroy
    has_many :prestations, dependent: :destroy

end
