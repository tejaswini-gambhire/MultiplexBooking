class Seat < ApplicationRecord
  belongs_to :show
  belongs_to :booking, optional: true

  validates :name, :price, :position, presence: true
  validates :price, numericality: true
  validate :booking_id_not_changed, on: :update

  private

  def booking_id_not_changed
    if booking_id_changed? && booking_id_was != nil && self.persisted?
      errors.add(:booking_id, 'This seat is already booked')
    end
  end
end
