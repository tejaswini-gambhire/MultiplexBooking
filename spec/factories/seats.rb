FactoryBot.define do
  factory :seat do
    name { Faker::Number.between(from: 1, to: 50).to_s }
    price { 100.5 }
    position {'lower'}
    
    association :show
  end


  factory :booked_seat, parent: :seat do
    association :booking
  end
end
