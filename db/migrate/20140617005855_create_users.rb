class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :untappd_id
      t.string :user_name
      t.string :location
      t.date :birthday
      t.references :user_beers, index: true
      t.references :checkin, index: true

      t.timestamps
    end
  end
end
