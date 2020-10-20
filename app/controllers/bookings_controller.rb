class BookingsController < ApplicationController
  def index
    authorize Booking

    @bookings = Booking.get_reports_data(filter_params)
  end

  private

  def filter_params
    params.permit(:date, :screen_id)
  end
end
