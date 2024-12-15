class Avo::Resources::Saison < Avo::BaseResource
  self.title = :libelle
  self.includes = [:residences_saisons, :residences]
  self.includes = [:saisons_pieces, :pieces]
  self.includes = [:saisons_materiels, :materiels]
  self.includes = [:saisons_prestations, :prestations]

  def fields
    field :id, as: :id
    field :libelle, as: :text, name: "Libellé"

    # Champ de sélection pour début de saison
    field :debut_saison, as: :select, name: "Début Saison", options: (1..12).to_a.map { |m| [Date::MONTHNAMES[m], m] }

    # Champ de sélection pour fin de saison
    field :fin_saison, as: :select, name: "Fin Saison", options: (1..12).to_a.map { |m| [Date::MONTHNAMES[m], m] }

    # Relation Many-to-Many avec les résidences
    field :residences_saisons, as: :has_many
    field :residences, as: :has_many

    # Relation avec Pieces
    field :saisons_pieces, as: :has_many
    field :pieces, as: :has_many

    # Relations avec Materiels
    field :saisons_materiels, as: :has_many
    field :materiels, as: :has_many

    # Relations avec Prestations
    field :saisons_prestations, as: :has_many
    field :prestations, as: :has_many
  end
end
