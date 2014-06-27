# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    owner
    sequence(:name) { |i| "event#{i}" }
    sequence(:place) { |i| "place#{i}" }
    sequence(:content) { |i| "content#{i}" }
    start_time { rand(1..30).days.from_now }
    end_time { start_time + rand(1..30).hours }
  end
end
