class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Devise: redirection après connexion
  def after_sign_in_path_for(resource)
    if resource.admin? # Vérifie si l'utilisateur est admin
      avo_path # Redirige l'admin vers l'espace Avo
    else
      root_path # Redirige les autres utilisateurs vers une autre page
    end
  end

  # Rediriger après inscription
  def after_sign_up_path_for(resource)
    if resource.admin?
      avo_path
    else
      root_path
    end
  end
end
