class Avo::Resources::Tarif < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :prix, as: :number
    field :saison, as: :belongs_to
    field :piece, as: :belongs_to
  end
end
