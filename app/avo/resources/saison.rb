class Avo::Resources::Saison < Avo::BaseResource
  self.title = :libelle

  def fields
    field :id, as: :id
    field :libelle, as: :text, name: "Libellé"

    # Champ de sélection pour début de saison
    field :debut_saison, as: :select, name: "Début Saison", options: (1..12).to_a.map { |m| [Date::MONTHNAMES[m], m] }

    # Champ de sélection pour fin de saison
    field :fin_saison, as: :select, name: "Fin Saison", options: (1..12).to_a.map { |m| [Date::MONTHNAMES[m], m] }
  end
end
