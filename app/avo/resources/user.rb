class Avo::Resources::User < Avo::BaseResource
  # Titre utilisé pour identifier les enregistrements (par exemple dans les listes)
  self.title = :email

  # Autorisation conditionnelle pour afficher cette ressource dans la barre latérale
  self.visible_on_sidebar = ->(view_context) { view_context.current_user&.admin? }

  # Définitions des champs
  def fields
    field :id, as: :id
    field :email, as: :text, name: "Email"
    field :nom, as: :text, name: "Nom"
    field :prenom, as: :text, name: "Prénom"
    field :adresse, as: :textarea, name: "Adresse"
    field :role, as: :select, name: "Rôle", options: User::ROLES

    # Ajout d'un champ pour la gestion des mots de passe (facultatif, selon vos besoins)
    field :password, as: :password, name: "Mot de passe", required: false
  end

  # Gestion des autorisations spécifiques pour les actions sur les ressources
  def authorized?(action, user)
    case action
    when :edit, :update
      # Autoriser uniquement les administrateurs et les éditeurs à modifier
      user.admin? || user.editor?
    when :destroy
      # Seuls les administrateurs peuvent supprimer
      user.admin?
    else
      # Autoriser toutes les autres actions par défaut
      true
    end
  end
end
