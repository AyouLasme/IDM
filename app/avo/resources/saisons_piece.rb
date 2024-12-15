class Avo::Resources::SaisonsPiece < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  #
  self.title = :id
  self.includes = [:saison, :piece]

  def fields
    field :id, as: :id
    field :saison, as: :belongs_to
    field :piece, as: :belongs_to
    field :prix, as: :number, step: 0.01, prefix: "€"
  end
end
