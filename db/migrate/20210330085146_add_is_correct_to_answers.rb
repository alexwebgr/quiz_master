class AddIsCorrectToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :is_correct, :boolean
  end
end
