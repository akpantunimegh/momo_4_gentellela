json.extract! subscription, :id, :code, :name, :description, :amount, :deposit, :html, :app_url, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
