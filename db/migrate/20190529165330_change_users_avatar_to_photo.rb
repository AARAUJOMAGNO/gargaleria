class ChangeUsersAvatarToPhoto < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :avatar, :photo
  end
end
