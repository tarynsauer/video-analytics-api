class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists, id: false do |t|
      t.string :id, primary: true
      t.string :account_id, null: false
      t.string :name, null: false
      t.string :video_ids, array: true
      t.string :playlist_type
      t.string :description
      t.string :reference_id
      t.boolean :favorite
      t.integer :limit
      t.string :search
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
