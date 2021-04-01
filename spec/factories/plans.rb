FactoryBot.define do
  factory :plan do
    label { "Free" }
    handle { "free" }
    price { 0 }
    duration { 50 }
    duration_unit { "year" }
  end
end
