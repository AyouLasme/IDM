class Avo::Resources::Disponibilite < Avo::BaseResource
  self.title = :id

  def fields
    field :id, as: :id
    field :date_debut, as: :date_time, name: "Date de début"
    field :date_fin, as: :date_time, name: "Date de fin"

    # Champ virtuel pour afficher la cible dans l'index et les vues show
    field :cible,
          as: :text,
          name: "Cible (Résidence ou Pièce)",
          only_on: [:index, :show] # Ce champ n'est pas affiché dans le formulaire

    # Champ sélection combinée pour les pièces et résidences
    field :reservable_id_and_type, as: :select, name: "Cible (Résidence ou Pièce)", options: -> {
      # Construire une liste combinée avec des étiquettes claires pour les types
      (Piece.all.map { |piece| ["Pièce: #{piece.description}", "Piece-#{piece.id}"] } +
        Residence.all.map { |residence| ["Résidence: #{residence.nom_de_la_residence}", "Residence-#{residence.id}"] })
    }


  end
end
