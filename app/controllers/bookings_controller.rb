class BookingsController < ApplicationController
  before_action :load_show_seats, only: [:create]

  def index
    authorize Booking

    @bookings = Booking.get_reports_data(filter_params)
  end

  def create
    @booking = Booking.new(
                show_id: params[:show_id],
                total_price: @seats.map(&:price).sum,
                seats_booked: @seats.size,
                user_id: current_user.id
              )

    @booking.seats << @seats

    if @booking.valid?
      @booking.save
      redirect_to booking_path(@booking.id), success: I18n.t('booking.create.success')
    else
      errors = @booking.errors.full_messages.join(', ')
      flash[:error] = errors
      redirect_to seats_show_path(params[:show_id])
    end
  end

  def show
    @booking = Booking.find params[:id]
    authorize @booking
    @booking = Booking.find params[:id]
  end

  def my_bookings
    @bookings = current_user.bookings.includes(show: :movie).order(created_at: :desc)
  end

  private

  def filter_params
    params.permit(:date, :screen_id)
  end

  def load_show_seats
    @seats = Seat.where(id: params[:seat_ids])

    if @seats.empty?
      flash[:error] = I18n.t('booking.invalid_seats')
      redirect_to seats_show_path(params[:show_id])
    elsif @seats.collect(&:booking_id).any?
      seat_names = @seats.where.not(booking_id: nil).pluck(:name)
      flash[:error] = I18n.t('booking.already_booked', seat_names: seat_names)
      redirect_to seats_show_path(params[:show_id])
    end
  end
end
