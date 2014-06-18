class CreateSubStyles < ActiveRecord::Migration
  def change
    create_table :sub_styles do |t|
      t.string :name
      t.references :beer, index: true
      t.integer :untappd_id

      t.timestamps
    end
  end
end
