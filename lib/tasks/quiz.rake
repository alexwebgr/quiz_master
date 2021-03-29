namespace :alexweb do
  desc "Create a quiz"
  task create_quiz: :environment do
    Quiz.create!(label: 'Awesome Quiz')
  end
end
