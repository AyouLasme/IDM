class Avo::Resources::Reservation < Avo::BaseResource
  def fields
    field :id, as: :id
    field :date_debut, as: :date_time
    field :date_fin, as: :date_time
    field :statut, as: :text
    field :montant_global, as: :number, readonly: true

    field :user, as: :belongs_to, searchable: true
    field :piece, as: :belongs_to, searchable: true, optional: true
    field :residence, as: :belongs_to, searchable: true, optional: true
  end
end
