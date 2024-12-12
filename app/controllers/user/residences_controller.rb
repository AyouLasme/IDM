class User::ResidencesController < ApplicationController
  before_action :authenticate_user! # Vérifie que l'utilisateur est connecté

  # Liste toutes les résidences disponibles
  def index
    @residences = Residence.all
  end

  # Affiche les détails d'une résidence spécifique
  def show
    @residence = Residence.find(params[:id])
    @pieces = @residence.pieces # Toutes les pièces liées à cette résidence
  end
end
