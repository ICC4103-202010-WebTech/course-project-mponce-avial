json.extract! event, :id, :title, :description, :banner, :location, :final_date, date_rule, visibility, organization_id, event_creator_id, :created_at, :updated_at
json.url event_url(event, format: :json)
