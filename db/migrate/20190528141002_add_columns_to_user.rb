class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :bool, default: false
    add_column :users, :address, :string
    add_column :users, :birthdate, :date
    add_column :users, :phone, :string
    add_column :users, :cpf, :string
    add_column :users, :cnpj, :string
    add_column :users, :company, :string
    add_column :users, :avatar, :string
  end
end
