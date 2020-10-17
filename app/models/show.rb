class Show < ApplicationRecord
  belongs_to :screen
  belongs_to :movie

  has_many :seats
  has_many :bookings
  has_many :users, through: :bookings

  # need to redefine this validation
  validates :movie, uniqueness: {scope: [:screen, :date, :start_time]}
end
