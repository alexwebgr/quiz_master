namespace :alexweb do
  desc "Create the plans"
  task create_plans: :environment do
    Plan.create(label: 'Free', price: 0, duration: 50, duration_unit: 'year')
    Plan.create(label: 'Gold monthly', price: 1, duration: 1, duration_unit: 'month')
    Plan.create(label: 'Gold yearly', price: 12, duration: 12, duration_unit: 'month')
  end
end
