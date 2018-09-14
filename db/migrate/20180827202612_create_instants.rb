class CreateInstants < ActiveRecord::Migration
  def change
    create_table :instants do |t|
      t.string :Oid
      t.string :follio
      t.integer :window_hours
      t.string :token_code
      t.datetime :date_of_confirmation
      t.datetime :date_of_cancelation
      t.string :device_of_cancelation
      t.string :device_of_transaction
      t.string :device_of_confirmation
      t.boolean :confirmed
      t.string :comment
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
