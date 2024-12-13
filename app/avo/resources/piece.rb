class Avo::Resources::Piece < Avo::BaseResource
  self.title = :description # Utilise le champ `description` comme titre

  def fields
    field :id, as: :id
    field :description, as: :textarea, name: "Description", placeholder: "Entrez une description pour la pièce"
    field :capacite, as: :number, name: "Capacité", placeholder: "Entrez la capacité maximale"

    # Relation vers Résidence
    field :residence, as: :belongs_to, name: "Résidence",
          searchable: true,
          display_as: :select,
          placeholder: "Sélectionnez une résidence",
          label: ->(residence) { residence.nom_de_la_residence if residence.present? }

    # Relation vers Type de Pièce
    field :type_de_piece, as: :belongs_to, name: "Type de Pièce",
          searchable: true,
          display_as: :select,
          placeholder: "Sélectionnez un type de pièce",
          label: ->(type) { type.libelle if type.present? }

    # Champ pour uploader plusieurs images
    field :images, as: :files, name: "Images"

    # Aperçu des images dans la vue de détails
    field :images_preview, as: :text, name: "Aperçu des Images", only_on: :show do |piece|
      if piece.present? && piece.images.attached?
        piece.images.map do |image|
          "<a href='#{Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)}' target='_blank'>
            <img src='#{Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)}'
                 style='max-width: 150px; max-height: 150px; border-radius: 8px; margin: 8px;'
                 alt='#{piece.description}' />
          </a>"
        end.join.html_safe
      else
        "Pas d'images disponibles"
      end
    end
  end
end
