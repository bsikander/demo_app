json.array!(@devices) do |device|
  json.extract! device, :user_id, :token, :enabled, :created_at, :updated_at, :platform
  json.url device_url(device, format: :json)
end