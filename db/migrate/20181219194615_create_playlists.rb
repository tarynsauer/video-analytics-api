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
      t.float :video_engagement_100
      t.float :video_engagement_75
      t.float :video_engagement_50
      t.float :video_engagement_25
      t.integer :video_seconds_viewed
      t.integer :video_impression
      t.float :engagement_score
      t.float :video_engagement_1
      t.float :video_percent_viewed
      t.integer :play_request
      t.integer :video_view
      t.float :play_rate
    end
  end
end
