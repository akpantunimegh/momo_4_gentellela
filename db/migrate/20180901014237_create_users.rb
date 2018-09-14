class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :Oid
      t.string :last_name
      t.string :middle_name
      t.string :first_name
      t.string :phone
      t.binary :photo
      t.string :mime_type
      t.date :date_of_birth
      t.string :account_reference
      t.boolean :account_active, default: false
      t.timestamps null: false
    end
  end
end
