class Avo::Resources::User < Avo::BaseResource
  self.title = :email # Utiliser le champ email comme titre principal

  # Champs pour la ressource User
  def fields
    field :id, as: :id
    field :nom, as: :text, name: "Nom"
    field :prenom, as: :text, name: "Prénom"
    field :email, as: :text, name: "Email"

    # Mot de passe et confirmation
    field :password, as: :password, hide_on: [:index, :show], name: "Mot de passe"
    field :password_confirmation, as: :password, hide_on: [:index, :show], name: "Confirmer le mot de passe"

    # Rôle de l'utilisateur
    field :role, as: :select, options: User::ROLES, name: "Rôle"

    # Adresse
    field :adresse, as: :textarea, name: "Adresse"
  end
end
