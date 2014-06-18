class CreateMainStyles < ActiveRecord::Migration
  def change
    create_table :main_styles do |t|
      t.string :name
      t.references :sub_style, index: true

      t.timestamps
    end
  end
end
