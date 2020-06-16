json.extract! registered_user, :id, :created_at, :updated_at
json.url registered_user_url(registered_user, format: :json)
