class ApplicationController < ActionController::Base
  include Pundit

  # Allow only modern browsers supporting required features
  allow_browser versions: :modern

  # Gestion des exceptions de Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Autoriser les champs supplémentaires dans Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Gestion des erreurs d'autorisation
  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
    redirect_to(request.referer || root_path)
  end

  # Rediriger après connexion
  def after_sign_in_path_for(resource)
    if resource.admin?
      avo_path # Redirige les administrateurs vers l'interface Avo
    else
      user_residences_path # Redirige les utilisateurs vers la liste des résidences
    end
  end

  # Autoriser les champs supplémentaires pour Devise
  def configure_permitted_parameters
    # Autoriser les champs supplémentaires pour l'inscription
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nom, :prenom, :adresse, :role])
    # Autoriser les champs supplémentaires pour la mise à jour du profil
    devise_parameter_sanitizer.permit(:account_update, keys: [:nom, :prenom, :adresse, :role])
  end
end
