class Groups::RegroupGroup < ActiveRecord::Base
  belongs_to :regroup
  has_many :regroup_group_members, dependent: :delete_all
  has_many :users, through: :regroup_group_members
end
