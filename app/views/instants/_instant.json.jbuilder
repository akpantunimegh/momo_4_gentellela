json.extract! instant, :id, :Oid, :follio, :window_hours, :token_code, :date_of_confirmation, :date_of_cancelation, :device_of_cancelation, :device_of_transaction, :device_of_confirmation, :confirmed, :comment, :account_id, :created_at, :updated_at
json.url instant_url(instant, format: :json)
