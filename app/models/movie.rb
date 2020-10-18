class Movie < ApplicationRecord
  has_many :shows
  has_many :screens, through: :shows

  validates :name, :duration, presence: true
  validates :duration, numericality: {only_integer: true, greater_than: 30}

  scope :active, -> { where(is_active: true) }
end
