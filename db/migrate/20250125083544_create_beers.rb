# create beers table
class CreateBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :percentage
      t.references :brand, null: false, foreign_key: true
      t.timestamps
    end
  end
end
