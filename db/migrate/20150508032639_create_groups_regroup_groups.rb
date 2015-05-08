class CreateGroupsRegroupGroups < ActiveRecord::Migration
  def change
    create_table :groups_regroup_groups do |t|
      t.references :regroup, index: true
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :groups_regroup_groups, :groups_regroups, column: :regroup_id
  end
end
