class Avo::Resources::Materiel < Avo::BaseResource
  self.title = :nom
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  self.title = :nom_du_materiel
  self.includes = [:saisons_materiels, :saisons]

  def fields
    field :id, as: :id
    field :nom, as: :text
    field :description, as: :textarea
    field :quantites_disponible, as: :number
    field :residence, as: :belongs_to

    # Relations avec Saisons
    field :saisons_materiels, as: :has_many
    field :saisons, as: :has_many
  end
end
