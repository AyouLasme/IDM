class ApplicationController < ActionController::Base
  include Pundit

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Gérer les exceptions de Pundit
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
    resource.admin? ? avo_path : root_path
  end

  # Autoriser les champs supplémentaires pour Devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nom, :prenom, :adresse])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nom, :prenom, :adresse])
  end
end
