# This migration creates the brands table with necessary columns
class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :country
      t.timestamps
    end
  end
end
