class User::ReservationsController < ApplicationController
  before_action :authenticate_user! # S'assurer que l'utilisateur est connecté

  # Afficher toutes les réservations de l'utilisateur connecté
  def index
    @reservations = current_user.reservations.includes(:residence, :piece)
  end

  # Nouvelle réservation
  def new
    @reservation = Reservation.new
    @residence = Residence.find(params[:residence_id])
  end

  # Créer une réservation pour une résidence ou une pièce
  def create
    @residence = Residence.find(params[:residence_id])
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.residence = @residence

    if params[:piece_id]
      @piece = @residence.pieces.find(params[:piece_id])
      @reservation.piece = @piece
    end

    if @reservation.save
      redirect_to user_reservations_path, notice: "Réservation créée avec succès."
    else
      flash[:alert] = "Erreur lors de la création de la réservation."
      render :new, status: :unprocessable_entity
    end
  end

  # Modifier une réservation existante
  def edit
    @reservation = current_user.reservations.find(params[:id])
  end

  # Mettre à jour une réservation existante
  def update
    @reservation = current_user.reservations.find(params[:id])

    if @reservation.update(reservation_params)
      redirect_to user_reservations_path, notice: "Réservation mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Supprimer une réservation
  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy
    redirect_to user_reservations_path, notice: "Réservation supprimée avec succès."
  end

  private

  # Paramètres autorisés pour la réservation
  def reservation_params
    params.require(:reservation).permit(:date_debut, :date_fin, :residence_id, :piece_id)
  end
end
