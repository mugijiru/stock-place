FactoryBot.define do
  factory :place_evaluation do
    place { nil }
    visited_on { Date.today }
    point { :good }
  end
end
