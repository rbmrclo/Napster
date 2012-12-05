class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :artist_id
      t.string :album_name
      t.date :date_published
      t.string :genre
      t.string :remarks

      t.timestamps
    end
  end
end
