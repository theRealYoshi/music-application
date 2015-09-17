class RemoveTrackFromAlbum < ActiveRecord::Migration
  def change
    remove_column :albums, :track_id
    remove_column :bands, :album_id
    add_index :albums, :band_id
    add_index :tracks, :album_id
    add_foreign_key :albums, :bands
    add_foreign_key :tracks, :albums
  end
end
