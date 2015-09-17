class AddAlbumIdtoBand < ActiveRecord::Migration
  def change
    add_column :bands, :album_id, :integer, unique: true
    add_index :bands, :album_id
  end
end
