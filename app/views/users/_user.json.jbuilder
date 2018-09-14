json.extract! user, :id, :Oid, :username, :last_name, :middle_name, :first_name, :phone, :photo, :date_of_birth, :account_reference, :recovery_text, :created_at, :updated_at
json.url user_url(user, format: :json)

