class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.string :track_list

      t.timestamps
    end
  end
end
