class Avo::Resources::Piece < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :description, as: :textarea
    field :capacite, as: :number
    field :residence, as: :belongs_to
    field :type_de_piece, as: :text
  end
end
