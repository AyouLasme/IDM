class Avo::Resources::Residence < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :nom_de_la_residence, as: :text
    field :adresse, as: :textarea
    field :description, as: :textarea
    field :image, as: :text
  end
end
