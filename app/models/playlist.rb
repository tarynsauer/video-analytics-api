class Playlist < ApplicationRecord
  self.primary_key = :id

  def cms_update!(payload={})
    update!(
      account_id: payload["account_id"],
      created_at: payload["created_at"],
      updated_at: payload["updated_at"],
      description: payload["description"],
      favorite: payload["favorite"],
      name: payload["name"],
      reference_id: payload["reference_id"],
      playlist_type: payload["type"],
      video_ids: payload["video_ids"],
    )
  end

  def analytics_update!(payload={})
    update!(
      video_engagement_100: payload['video_engagement_100'],
      video_engagement_75: payload['video_engagement_75'],
      video_engagement_50: payload['video_engagement_50'],
      video_engagement_25: payload['video_engagement_25'],
      video_seconds_viewed: payload['video_seconds_viewed'],
      video_impression: payload['video_impression'],
      engagement_score: payload['engagement_score'],
      video_engagement_1: payload['video_engagement_1'],
      video_percent_viewed: payload['video_percent_viewed'],
      play_request: payload['play_request'],
      video_view: payload['video_view'],
      play_rate: payload['play_rate'],
    )
  end
end
