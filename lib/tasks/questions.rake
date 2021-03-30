namespace :alexweb do
  desc "Create some questions"
  task create_questions: :environment do
    quiz = Quiz.find_or_create_by(label: 'Awesome Quiz')

    Question.create!(label: 'Do you like chocolate?', correct_answer: 'true', quiz: quiz)
    Question.create!(label: 'Do you like bananas?', correct_answer: 'true', quiz: quiz)
    Question.create!(label: 'Do you like sardines?', correct_answer: 'false', quiz: quiz)
  end
end
