json.extract! profile, :id, :user_id, :lattes, :facebook, :twitter, :created_at, :updated_at
json.url profile_url(profile, format: :json)
