FactoryBot.define do
  factory :booking do
    user { nil }
    show { nil }
    seats_booked { 1 }
    total_price { 1.5 }
  end
end
