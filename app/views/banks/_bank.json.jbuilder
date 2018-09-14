json.extract! bank, :id, :code, :name, :account_number, :account_id, :created_at, :updated_at
json.url bank_url(bank, format: :json)
