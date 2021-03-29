FactoryBot.define do
  factory :answer do
    supplied_answer { "MyString" }
    question
    user
  end
end
