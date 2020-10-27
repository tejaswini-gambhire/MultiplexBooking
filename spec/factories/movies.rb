FactoryBot.define do
  factory :movie do
    name { Faker::Movie.title }
    is_active { true }
    duration { 120 }
  end
end
