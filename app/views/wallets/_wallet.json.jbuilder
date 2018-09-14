json.extract! wallet, :id, :Oid, :code, :name, :description, :blocked, :date_blocked, :balance, :account_id, :created_at, :updated_at
json.url wallet_url(wallet, format: :json)
