class Movie < ApplicationRecord
  has_many :shows, dependent: :destroy
  has_many :screens, through: :shows, dependent: :destroy

  validates :name, :duration, presence: true
  validates :name, uniqueness: true
  validates :duration, numericality: {only_integer: true, greater_than: 30}

  scope :active, -> { where(is_active: true) }
end
