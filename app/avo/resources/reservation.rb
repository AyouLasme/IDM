class Avo::Resources::Reservation < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :date_debut, as: :date_time
    field :date_fin, as: :date_time
    field :statut, as: :text
    field :montant_global, as: :number
    field :user, as: :belongs_to
    field :piece, as: :belongs_to
  end
end
