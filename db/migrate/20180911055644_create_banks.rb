class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :code
      t.string :name
      t.string :account_number
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
