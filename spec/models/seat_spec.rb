require 'rails_helper'

RSpec.describe Seat, type: :model do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :position }
    it { should validate_numericality_of :price }
  end

  context "associations" do
    it { should belong_to(:booking).optional }
    it { should belong_to(:show) }
  end

  it 'should not allow to book an already booked seat' do
    booking = create(:booking)
    booked_seats = booking.seats

    another_booking = create(:booking)
    another_booking.seats << booked_seats.first
    expect(another_booking.validate).to eq(false)
  end
end
