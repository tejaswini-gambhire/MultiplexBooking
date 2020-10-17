class Show < ApplicationRecord
  belongs_to :screen
  belongs_to :movie

  has_many :seats
  has_many :bookings
  has_many :users, through: :bookings
end
