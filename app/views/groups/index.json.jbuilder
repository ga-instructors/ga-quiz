json.array!(@groups) do |group|
  json.extract! group, :id, :name, :start_at, :end_at
  json.url group_url(group, format: :json)
end
