require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :duration }
  end

  context "associations" do
    it { should have_many(:shows).dependent(:destroy) }
    it { should have_many(:screens).dependent(:destroy) }
  end

  context "scopes" do
    before do
      create(:movie)
      create(:movie, is_active: false)
    end

    context "#active" do
      it 'should return active movies only' do
        expect(Movie.active.count).to eq(1)
      end
    end
  end
end
