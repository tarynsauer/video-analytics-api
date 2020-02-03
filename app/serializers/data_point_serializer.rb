class DataPointSerializer < ActiveModel::Serializer
  attributes :id, :playlist_id, :video_engagement_100, :video_engagement_75, :video_engagement_50,
    :video_engagement_25, :video_seconds_viewed, :video_impression, :engagement_score, :video_engagement_1,
    :video_percent_viewed, :play_request, :video_view, :play_rate, :captured_at
end
