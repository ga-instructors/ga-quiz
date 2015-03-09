class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :user, index: true
      t.string :user_agent
      t.string :ip_address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
    add_foreign_key :sessions, :users
  end
end
