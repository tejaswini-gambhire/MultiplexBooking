require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :mobile_number }
    it { should validate_uniqueness_of :email }
    it { should validate_uniqueness_of :mobile_number }
  end

  context "associations" do
    it { should belong_to(:role) }
    it { should have_many(:bookings) }
    it { should have_many(:booked_shows) }
  end
end
