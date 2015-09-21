class AddColumnToNote < ActiveRecord::Migration
  def change
    add_column :notes, :user_id, :integer
    add_column :notes, :track_id, :integer
    add_index :notes, :user_id
    add_index :notes, :track_id
  end
end
