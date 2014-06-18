class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.integer :untappd_id
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.float :lat
      t.float :lng
      t.references :beer, index: true

      t.timestamps
    end
  end
end
