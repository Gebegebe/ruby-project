class ChangePhotoInGames < ActiveRecord::Migration
  def change
    #remove_column :games, :photo
    add_column :games, :photo_file_name, :string
    add_column :games, :photo_content_type, :string
    add_column :games, :photo_file_size, :integer
  end
end
