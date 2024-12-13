class Avo::Resources::Paiement < Avo::BaseResource
  def fields
    field :id, as: :id
    field :montant, as: :number
    field :date_paie, as: :date_time
    field :mode_paie, as: :select, name: "Mode de Paiement", options: {
      'Carte Bancaire' => 'carte_bancaire',
      'Espèces' => 'especes',
      'Chèque' => 'cheque',
      'Virement Bancaire' => 'virement_bancaire'
    }, required: true
    field :reservation, as: :belongs_to
  end
end
