FactoryBot.define do
  factory :booking do
    association :user, role: Role.find_by_name('Customer')
    association :show
    seats_booked { 3 }
    total_price { 300 }

    after(:build) do |booking|
      seats = []
      3.times do |index|
        seats << create(:seat, name: index.to_s)
      end

      booking.seats << seats
    end
  end
end
