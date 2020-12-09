json.extract! server, :id, :package_id, :name, :disk_space, :paid, :paid_date, :user_id, :created_at, :updated_at
json.url server_url(server, format: :json)
