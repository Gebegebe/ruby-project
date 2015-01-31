class ChangePassToPassword < ActiveRecord::Migration
  def change
    rename_column :users, :pass, :password
  end
end
