class AddRentedGamesToUser < ActiveRecord::Migration
  def change
    add_column :users, :game_ids, :string
  end
end
