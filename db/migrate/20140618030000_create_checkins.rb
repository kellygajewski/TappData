class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :checkin_id
      t.datetime :untappd_created_at
      t.float :rating_score
      t.integer :uid
      t.string :first_name
      t.integer :bid
      t.string :beer_name
      t.integer :brewery_id
      t.string :brewery_name
      t.string :venue_city
      t.string :venue_state
      t.float :lat
      t.float :lng

      #new
      t.references :beer, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
