class AddPublishedToBeverages < ActiveRecord::Migration[5.2]
  def change
    add_column :beverages, :published, :bool, default: true
  end
end
