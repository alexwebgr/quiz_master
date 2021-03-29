FactoryBot.define do
  factory :user do
    first_name { "dom" }
    email { "dom@mail.com" }
    token { nil }
  end
end
