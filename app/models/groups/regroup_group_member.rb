class Groups::RegroupGroupMember < ActiveRecord::Base
  belongs_to :regroup_group
  belongs_to :user
end
