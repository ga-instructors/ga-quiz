json.array!(@sessions) do |session|
  json.extract! session, :id, :user_id, :user_agent, :ip_address, :latitude, :longitude
  json.url session_url(session, format: :json)
end
