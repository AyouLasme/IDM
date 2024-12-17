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

  def show
    @residence = Residence.find(params[:id])
    @pieces = @residence.pieces

    # Récupérer les prix associés aux saisons pour la résidence via la table intermédiaire
    @tarifs_residence = ResidencesSaison.includes(:saison).where(residence: @residence)

    # Récupérer les tarifs pour chaque pièce via la table intermédiaire
    @tarifs_pieces = {}
    @pieces.each do |piece|
      @tarifs_pieces[piece.id] = SaisonsPiece.includes(:saison).where(piece: piece)
    end

    # Initialisation de @reservation pour le formulaire
    @reservation = Reservation.new
    end
end
