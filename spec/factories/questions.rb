FactoryBot.define do
  factory :question do
    label { "MyString" }
    correct_answer { 'true' }
    quiz
  end
end
