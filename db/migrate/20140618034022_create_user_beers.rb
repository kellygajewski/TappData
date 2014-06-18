class CreateUserBeers < ActiveRecord::Migration
  def change
    create_table :user_beers do |t|
      t.references :user, index: true
      t.references :beer, index: true

      t.timestamps
    end
  end
end
