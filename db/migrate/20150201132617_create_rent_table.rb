class CreateRentTable < ActiveRecord::Migration
  def change
    create_table :rent_tables do |t|
      t.integer :user_id
      t.integer :game_id
    end
  end
end
