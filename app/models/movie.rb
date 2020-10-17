class Movie < ApplicationRecord
  has_many :shows
  has_many :screens, thorugh: :shows

  validates :name, :duration, presence: true
  validates :duration, numericality: {only_integer: true, greater_than: 30}
end
