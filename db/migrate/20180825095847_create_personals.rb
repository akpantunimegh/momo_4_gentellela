class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :last_name
      t.string :middle_name
      t.string :first_name
      t.string :phone
      t.binary :photo
      t.date :date_of_birth
      t.string :account_reference
      t.timestamps null: false
      t.references :user, index: true, foreign_key: true
    end
  end
end
