FactoryBot.define do
  factory :screen do
    name { Faker::Lorem.word }
    total_seats { 50 }
    seat_distribution { {lower: {count: 30, additional_cost: 0},
     upper: {count: 20, additional_cost: 20}} }
  end
end
