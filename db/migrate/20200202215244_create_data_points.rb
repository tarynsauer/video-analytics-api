class CreateDataPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :data_points do |t|
      t.belongs_to :playlist
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
      t.datetime :created_at, null: false
    end
  end
end
