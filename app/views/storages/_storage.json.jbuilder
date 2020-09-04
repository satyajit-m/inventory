json.extract! storage, :id, :item_id, :qty, :min_buffer, :max_buffer, :created_at, :updated_at
json.url storage_url(storage, format: :json)
