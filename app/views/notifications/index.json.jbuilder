json.array!(@notifications) do |notification|
  json.extract! notification, :user_id, :message, :status
  json.url notification_url(notification, format: :json)
end