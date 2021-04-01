FactoryBot.define do
  factory :subscription do
    start_date { "2021-04-01 12:33:31" }
    end_date { "2021-04-01 12:33:31" }
    user
    plan
    subscription_status
  end
end
