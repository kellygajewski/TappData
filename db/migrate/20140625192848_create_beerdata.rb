class CreateBeerdata < ActiveRecord::Migration
  def change
    create_table :beerdata do |t|
      t.string :username

      t.timestamps
    end
  end
end
