json.array!(@groups_regroups) do |groups_regroup|
  json.extract! groups_regroup, :id, :group_id, :name, :target_group_size
  json.url groups_regroup_url(groups_regroup, format: :json)
end
