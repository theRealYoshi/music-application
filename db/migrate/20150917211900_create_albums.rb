class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :track_id, null: false
      t.integer :band_id, null: false
      t.string :performance, null: false

      t.timestamps null: false
    end
  end
end
