class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :code
      t.string :name
      t.string :description
      t.decimal :amount
      t.decimal :discount, default: 0
      t.decimal :deposit
      t.integer :max_transactions, default: 0
      t.decimal :max_amount, default: 0
      t.decimal :max_transfer_amount, default: 0
      t.boolean :smart_contracts, default: false
      t.string :html
      t.string :app_url
      t.timestamps null: false
    end
  end
end
