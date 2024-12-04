class Avo::Resources::User < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :nom, as: :text
    field :prenom, as: :text
    field :email, as: :text
    field :mot_de_passe, as: :text
    field :role, as: :text
    field :adresse, as: :textarea
  end
end
