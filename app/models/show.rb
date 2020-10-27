class Show < ApplicationRecord
  belongs_to :screen
  belongs_to :movie

  has_many :seats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  # need to redefine this validation
  validates :movie_id, uniqueness: {scope: [:screen_id, :date, :start_time]}
  validates :start_time, :end_time, :date, presence: true

  scope :upcoming_shows, -> do
    where('date >= ? AND start_time >= ?', Date.current, Time.current + 1.hour)
  end

  def status
    'Available'
  end
end
