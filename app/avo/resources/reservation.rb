class Avo::Resources::Reservation < Avo::BaseResource
  def fields
    # ID et dates
    field :id, as: :id
    field :date_debut, as: :date_time, name: "Date de début"
    field :date_fin, as: :date_time, name: "Date de fin"

    # Statut
    field :statut, as: :text

    field :montant_par_jour, as: :number, readonly: true

    field :montant_global, as: :number, readonly: true

    field :user, as: :belongs_to, searchable: true
    field :piece, as: :belongs_to, searchable: true, optional: true
    field :residence, as: :belongs_to, searchable: true, optional: true


    def fields
      # Montant par jour (lecture seule)
      field :montant_par_jour, as: :number, readonly: true, name: "Montant par jour" do |resource|
        resource.montant_par_jour
      end

      # Montant global (calculé automatiquement)
      field :montant_global, as: :number, readonly: true, name: "Montant Global" do |resource|
        nombre_de_jours = ((resource.date_fin.to_date - resource.date_debut.to_date).to_i + 1) rescue 0
        resource.montant_par_jour * nombre_de_jours
      end

      # Relations
      field :user, as: :belongs_to, searchable: true, name: "Utilisateur"
      field :piece, as: :belongs_to, searchable: true, optional: true, name: "Pièce"
      field :residence, as: :belongs_to, searchable: true, optional: true, name: "Résidence"
    end
  end
end
