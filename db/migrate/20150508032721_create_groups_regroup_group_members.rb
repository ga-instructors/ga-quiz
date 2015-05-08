class CreateGroupsRegroupGroupMembers < ActiveRecord::Migration
  def change
    create_table :groups_regroup_group_members do |t|
      t.references :regroup_group, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :groups_regroup_group_members, :groups_regroup_groups, column: :regroup_group_id
    add_foreign_key :groups_regroup_group_members, :users
  end
end
