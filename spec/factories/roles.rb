FactoryBot.define do
  factory :role do
  end

  factory :admin, parent: :role do
    name { 'Admin' }
  end

  factory :customer, parent: :role do
    name { 'Customer' }
  end
end
