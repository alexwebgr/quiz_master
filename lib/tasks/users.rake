namespace :alexweb do
  desc "Create some users"
  task create_users: :environment do
    User.create(first_name: 'alex', email: 'web@mail.com')
    User.create(first_name: 'jon', email: 'jon@mail.com')
    User.create(first_name: 'jane', email: 'jane@mail.com')
    User.create(first_name: 'jose', email: 'jose@mail.com')
  end
end
