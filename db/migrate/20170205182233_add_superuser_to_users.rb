class AddSuperuserToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :superuser, :boolean
    add_column :users, :default, :false
  end
end
