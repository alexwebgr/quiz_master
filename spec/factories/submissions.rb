FactoryBot.define do
  factory :submission do
    answers { "1,2,3" }
    score { "80" }
    user
    quiz
  end
end
