class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps null: false
    end
  end
end
