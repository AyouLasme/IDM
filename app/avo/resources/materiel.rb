class Avo::Resources::Materiel < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :nom, as: :text
    field :description, as: :textarea
    field :quantites_disponible, as: :number
    field :residence, as: :belongs_to
  end
end
