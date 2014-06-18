class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :untappd_id
      t.datetime :untappd_created_at
      t.float :user_rating
      t.integer :untappd_user_id
      t.integer :untappd_beer_id
      t.integer :untappd_brewery_id
      t.string :city
      t.string :state
      t.string :country
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
