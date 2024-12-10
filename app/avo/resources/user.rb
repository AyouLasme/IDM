class Avo::Resources::User < Avo::BaseResource
  self.title = :email # Définir le champ utilisé comme titre principal

  # Champs pour la ressource User
  def fields
    field :id, as: :id
    field :nom, as: :text
    field :prenom, as: :text
    field :email, as: :text
    field :encrypted_password, as: :password, hide_on: [:index, :show], name: "Mot de passe" # Adapter au champ devise
    field :role, as: :select, options: User::ROLES, name: "Rôle"
    field :adresse, as: :textarea, name: "Adresse"
  end
end
