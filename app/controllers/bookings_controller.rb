class BookingsController < ApplicationController

  def index
    if current_user.nanny && current_user.nanny.bookings.any?
      @bookings = current_user.nanny.bookings
    end
      @request_bookings = current_user.bookings
      @review = Review.new
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to bookings_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    @booking.save
    redirect_to bookings_path
  end


  def new
    @booking = Booking.new
    @nanny = Nanny.find(params[:nanny_id])
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @nanny = Nanny.find(params[:nanny_id])
    @booking.nanny = @nanny
    if @booking.save
      redirect_to bookings_path, notice: 'booking created! Waiting for Nanny to accept offer'
    else
      render :new
    end
  end

 private

  def bookings_params
    params.require(:booking).permit(:address, :kids_number, :message, :start_date, :end_date, :photo)
  end
end


