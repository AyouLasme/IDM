class Avo::Resources::TypeDePiece < Avo::BaseResource
  self.title = :libelle
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :libelle, as: :text
  end
end
