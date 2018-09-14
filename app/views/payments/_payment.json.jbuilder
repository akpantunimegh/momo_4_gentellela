json.extract! payment, :id, :Oid, :follio, :token_code, :action_code, :payment_class, :source_account, :source_identifier, :target_account, :target_identifier, :value, :charges, :settled, :date_of_entry, :instant_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
