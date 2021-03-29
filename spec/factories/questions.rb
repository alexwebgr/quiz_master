FactoryBot.define do
  factory :question do
    label { "MyString" }
    correct_answer { "MyString" }
    quiz
  end
end
