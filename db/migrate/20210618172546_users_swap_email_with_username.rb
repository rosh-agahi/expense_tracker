class UsersSwapEmailWithUsername < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :email, :string
    add_column :users, :username, :string
  end
end
