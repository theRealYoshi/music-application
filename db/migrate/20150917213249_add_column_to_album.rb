class AddColumnToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :title, :string
    add_column :tracks, :track_title, :string
  end
end
