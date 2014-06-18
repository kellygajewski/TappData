class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.integer :untappd_id
      t.string :name
      t.float :abv
      t.string :description
      t.string :style
      t.boolean :is_in_production
      t.integer :total_rating_count
      t.float :average_overall_rating
      t.string :untappd_brewery_id
      t.references :checkin, index: true
      t.references :user_beers, index: true

      t.timestamps
    end
  end
end
