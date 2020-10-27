FactoryBot.define do
  factory :show do
    date { Date.current + 1.day }
    start_time { DateTime.parse("#{Date.current + 1.day} 12:00PM") }
    end_time { DateTime.parse("#{Date.current + 1.day} 3:00PM") }
    association :screen
    association :movie
  end
end
