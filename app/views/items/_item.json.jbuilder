json.extract! item, :id, :user_id, :price, :name, :stock, :created_at, :updated_at
json.url item_url(item, format: :json)
