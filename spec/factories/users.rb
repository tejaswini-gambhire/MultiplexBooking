FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    mobile_number { Faker::Number.number(10) }
    password {Faker::Internet.password}
    role { Role.find_by_name('Customer') }
  end
end
