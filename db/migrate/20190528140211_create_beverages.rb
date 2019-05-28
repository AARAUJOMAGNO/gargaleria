class CreateBeverages < ActiveRecord::Migration[5.2]
  def change
    create_table :beverages do |t|
      t.references :user, foreign_key: true
      t.float :price
      t.integer :stock
      t.string :genre
      t.string :category
      t.string :brand
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
