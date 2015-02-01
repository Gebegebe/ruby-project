class AddPhotoToGames < ActiveRecord::Migration
  def change
    add_column :games, :photo, :photo
  end
end
