class CreateVaults < ActiveRecord::Migration
  def change
    create_table :vaults do |t|
      t.string :name
      t.string :password_token
      t.decimal :balance
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
