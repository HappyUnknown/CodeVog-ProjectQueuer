class AddUserRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :userRole, :integer
  end
end
