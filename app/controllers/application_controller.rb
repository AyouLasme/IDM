class ApplicationController < ActionController::Base
  include Pundit

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Gérer les exceptions de Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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
end

