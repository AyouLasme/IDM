class Avo::Resources::Saison < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :libelle, as: :text
    field :debut_saison, as: :date
    field :fin_saison, as: :date
  end
end
