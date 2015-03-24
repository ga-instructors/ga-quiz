class AddColumnsToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :country, :string
    add_column :sessions, :region, :string
    add_column :sessions, :city, :string
  end
end
