require 'rails_helper'

RSpec.describe Show, type: :model do
  context "validations" do
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }
    # TODO fix following spec
    # it { should validate_uniqueness_of(:movie).scoped_to(:screen, :date, :start_time) }
  end

  context "associations" do
    it { should belong_to(:screen) }
    it { should belong_to(:movie) }
    it { should have_many(:seats).dependent(:destroy) }
    it { should have_many(:bookings).dependent(:destroy) }
    it { should have_many(:users) }
  end

  context "scopes" do
    before do
      create(:show)
      create(:show, date: Date.current, start_time: DateTime.current - 6.hours,
        end_time: DateTime.current - 3.hours)
      create(:show, date: Date.current, start_time: DateTime.current + 30.minutes,
        end_time: DateTime.current + 3.hours)
    end

    context "#upcoming_shows" do
      it 'should give list of only upcoming shows' do
        expect(Show.upcoming_shows.count).to eq(1)
      end
    end
  end
end
