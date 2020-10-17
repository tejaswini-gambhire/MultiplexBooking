class Seat < ApplicationRecord
  belongs_to :show
  belongs_to :booking, optional: true
end
