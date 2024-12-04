class Avo::Resources::Paiement < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :montant, as: :number
    field :date_paie, as: :date_time
    field :mode_paie, as: :text
    field :reservation, as: :belongs_to
  end
end
