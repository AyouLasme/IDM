class Avo::Resources::Prestation < Avo::BaseResource
  self.title = :libelle
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :libelle, as: :text
    field :description, as: :textarea
    field :residence, as: :belongs_to
  end
end
