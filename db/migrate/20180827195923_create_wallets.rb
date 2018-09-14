class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :Oid
      t.string :account_reference , null: true
      t.string :code
      t.string :name
      t.string :description
      t.boolean :blocked,  default: false
      t.datetime :date_blocked
      t.decimal :available_balance,  default: 0.00
      t.decimal :blocked_balance,  default: 0.00
      t.integer :usage_count, default: 0
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
