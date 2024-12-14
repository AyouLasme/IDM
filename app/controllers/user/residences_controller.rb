class User::ResidencesController < ApplicationController
  before_action :authenticate_user! # Vérifie que l'utilisateur est connecté

  # Liste toutes les résidences disponibles
  def index
    @residences = Residence.all

    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @residences = @residences.where('available_from <= ? AND available_to >= ?', end_date, start_date)
    end
  end

  # Affiche les détails d'une résidence spécifique
  def show
    @residence = Residence.find(params[:id])
    @pieces = @residence.pieces # Toutes les pièces liées à cette résidence
  end
end
