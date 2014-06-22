class RemoveUserBeersFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :user_beers, :references
  end
end
