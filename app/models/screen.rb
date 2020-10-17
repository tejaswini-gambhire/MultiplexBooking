class Screen < ApplicationRecord
  has_many :shows
  has_many :movies, through: :shows
end
