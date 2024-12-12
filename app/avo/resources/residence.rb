class Avo::Resources::Residence < Avo::BaseResource
  def fields
    field :id, as: :id
    field :nom_de_la_residence, as: :text, name: "Nom"
    field :adresse, as: :textarea, name: "Adresse"
    field :description, as: :textarea, name: "Description"

    # Champ pour uploader plusieurs images
    field :images, as: :files, name: "Images"

    # Aperçu des images (pour la vue des détails uniquement)
    field :images_preview, as: :text, name: "Aperçu des Images", only_on: :show do |residence|
      if residence.respond_to?(:images) && residence.images.attached?
        residence.images.map do |image|
          "<a href='#{Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)}' target='_blank' style='display: inline-block; margin: 8px;'>
            <img src='#{Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)}'
                 style='max-width: 150px; max-height: 150px; border-radius: 8px;'
                 alt='#{residence.nom_de_la_residence}' />
          </a>"
        end.join.html_safe
      else
        "Pas d'images disponibles"
      end
    end
  end
end
