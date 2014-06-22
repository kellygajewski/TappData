class RemoveUserBeersIdFromBeers < ActiveRecord::Migration
  def change
  	remove_column :beers, :user_beers_id, :integer
  end
end
