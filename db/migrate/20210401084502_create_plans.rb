class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :label
      t.string :handle
      t.integer :price
      t.integer :duration
      t.string :duration_unit

      t.timestamps
    end
  end
end
