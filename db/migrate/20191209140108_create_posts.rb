class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :subscription_name
      t.text :description
      t.integer :monthly_price
      t.integer :trial_term
      t.string :url

      t.timestamps
    end
  end
end
