class AddSellerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :seller, :bool, default: false
  end
end
