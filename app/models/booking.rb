class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :show

  has_many :seats

  validates :seats_booked, presence: true, numericality: { only_integer: true }
  validates :total_price, presence: true, numericality: true
  validate :total_price_should_be_greater_than_sum_of_seat_price

  scope :for_date, -> (date) {
    where(
      'bookings.created_at >= ? AND bookings.created_at <= ?',
       date.beginning_of_day, date.end_of_day
    )
  }

  def self.get_reports_data(filters)
    date = (filters[:date].presence || Date.current).to_date

    criteria = Booking
                .joins(:user, :seats, show: [:screen])
                .group('users.email', 'screens.name')
                .for_date(date)
    criteria = criteria.where('shows.screen_id = ?', filters[:screen_id]) if filters[:screen_id]

    criteria
      .select(
        'users.email, screens.name AS screen_name, ARRAY_AGG(seats.name) AS seat_names')
      .as_json
  end

  private

  def total_price_should_be_greater_than_sum_of_seat_price
    if self.seats.map(&:price).sum > self.total_price
      errors.add(:total_price, 'Total price should be greater than sum of all seats')
    end
  end
end
