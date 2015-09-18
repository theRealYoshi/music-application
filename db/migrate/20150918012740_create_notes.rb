class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :long_note, null: false

      t.timestamps null: false
    end
  end
end
