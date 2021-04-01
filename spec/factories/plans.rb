FactoryBot.define do
  factory :plan do
    label { "Free" }
    handle { nil }
    price { 0 }
    duration { 50 }
    duration_unit { "year" }
  end
end
