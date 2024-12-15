class Avo::Resources::Materiel < Avo::BaseResource
  self.title = :nom
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  self.title = :nom
  self.includes = [:saisons_materiels, :saisons]

  def fields
    field :id, as: :id
    field :nom, as: :text , show_on: [:index, :show]
    field :description, as: :text , show_on: [:index, :show]
    field :quantites_disponible, as: :number , show_on: [:index, :show]
    field :residence, as: :belongs_to
    field :prix, as: :number, name: "Prix", readonly: true

    # Relations avec Saisons
    field :saisons_materiels, as: :has_many
    field :saisons, as: :has_many
  end
end
