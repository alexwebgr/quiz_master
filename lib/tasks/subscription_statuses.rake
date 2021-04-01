namespace :alexweb do
  desc "Create the subscription_statuses"
  task create_subscription_statuses: :environment do
    SubscriptionStatus.create(label: 'Upcoming')
    SubscriptionStatus.create(label: 'Active')
    SubscriptionStatus.create(label: 'Expired')
  end
end
