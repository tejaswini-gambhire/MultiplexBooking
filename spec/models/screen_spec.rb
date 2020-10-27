require 'rails_helper'

RSpec.describe Screen, type: :model do
  
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :total_seats }
    it { should validate_numericality_of(:total_seats).only_integer }
  end

  context "associations" do
    it { should have_many(:shows) }
    it { should have_many(:movies) }
  end

end
