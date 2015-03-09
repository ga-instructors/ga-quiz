class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.references :user, index: true
      t.references :group, index: true
      t.string :role

      t.timestamps null: false
    end
    add_foreign_key :group_members, :users
    add_foreign_key :group_members, :groups
  end
end
