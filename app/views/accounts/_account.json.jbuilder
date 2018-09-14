json.extract! account, :id, :Oid, :account_reference, :name, :balance, :blocked, :date_blocked, :expired, :date_of_expiry, :bank, :user_id, :created_at, :updated_at
json.url account_url(account, format: :json)
