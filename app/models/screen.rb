class Screen < ApplicationRecord
  has_many :shows
  has_many :movies, through: :shows

  validates :name, :total_seats, presence: true
  validates :total_seats, numericality: {only_integer: true}
end
