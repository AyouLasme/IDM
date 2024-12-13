class Avo::Resources::Disponibilite < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :date_debut, as: :date_time, name: "Date de début"
    field :date_fin, as: :date_time, name: "Date de fin"
    field :piece, as: :belongs_to
    field :residence, as: :belongs_to

    # Relation polymorphique pour prendre en charge Résidences et Pièces
    field :reservable, as: :polymorphic_belongs_to, types: [Piece, Residence], name: "Cible (Résidence ou Pièce)"
  end
end
