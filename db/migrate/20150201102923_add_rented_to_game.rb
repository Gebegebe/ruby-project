class AddRentedToGame < ActiveRecord::Migration
  def change
    add_column :games, :is_rented, :boolean
  end
end
