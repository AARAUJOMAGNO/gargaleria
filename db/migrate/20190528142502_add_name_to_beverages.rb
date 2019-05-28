class AddNameToBeverages < ActiveRecord::Migration[5.2]
  def change
    add_column :beverages, :name, :string
  end
end
