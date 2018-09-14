json.extract! vault, :id, :name, :password_token, :balance, :account_id, :created_at, :updated_at
json.url vault_url(vault, format: :json)
