json.extract! payment, :id, :title, :name, :deadline, :price, :created_at, :updated_at
json.url payment_url(payment, format: :json)
