json.array!(@group_members) do |group_member|
  json.extract! group_member, :id, :name, :email, :role
  json.url group_member_url(@group, group_member, format: :json)
end
