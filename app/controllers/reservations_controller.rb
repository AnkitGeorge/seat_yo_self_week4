class ReservationsController < ApplicationController
  # This shows all reservations for the 'owner-user'
  def index
    @reservations = Reservation.all
  end

  # Used to inspect a single reservation.
  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @Reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to restaurant_reservations_path
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :party_size, :time_slot)
  end

end
