class AddTermsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :terms, :bool, default: false
  end
end
