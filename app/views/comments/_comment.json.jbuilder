json.extract! comment, :id, :profile_picture, :text ,:image ,:registered_user ,:event, :created_at, :updated_at
json.url comment_url(comment, format: :json)
