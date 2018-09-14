class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :Oid
      t.string :account_reference , null: true
      t.string :encrypted_password, null: true, default: "N/A"
      t.string :encrypted_pin, null: true, default: "N/A"
      t.string :name, default: "N/A"
      t.decimal :total_balance, default: 0
      t.decimal :blocked_balance, default: 0
      t.decimal :available_balance, default: 0
      t.boolean :blocked, default: false
      t.datetime :date_blocked
      t.boolean :expired, default: false
      t.date :date_of_expiry
      t.string :bank
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :accounts, :Oid, unique: true
    add_index :accounts, :account_reference, unique: true

  end
end
