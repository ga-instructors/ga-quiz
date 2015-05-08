class CreateGroupsRegroups < ActiveRecord::Migration
  def change
    create_table :groups_regroups do |t|
      t.references :group, index: true
      t.string :name
      t.integer :target_group_size

      t.timestamps null: false
    end
    add_foreign_key :groups_regroups, :groups
  end
end
