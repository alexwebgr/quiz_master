# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: 'alex', email: 'web@mail.com')
User.create!(first_name: 'jon', email: 'jon@mail.com')
User.create!(first_name: 'jane', email: 'jane@mail.com')
User.create!(first_name: 'jose', email: 'jose@mail.com')

quiz = Quiz.create!(label: 'Awesome Quiz')

Question.create!(label: 'Do you like chocolate?', correct_answer: 'true', quiz: quiz)
Question.create!(label: 'Do you like bananas?', correct_answer: 'true', quiz: quiz)
Question.create!(label: 'Do you like sardines?', correct_answer: 'false', quiz: quiz)