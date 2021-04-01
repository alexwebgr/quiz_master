class CreateSubscriptionStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :subscription_statuses do |t|
      t.string :label
      t.string :handle

      t.timestamps
    end
  end
end
