class CreateGenreTable < ActiveRecord::Migration
  def change
    create_table :genre_tables do |t|
      t.string :genre
    end
  end
end
