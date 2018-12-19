Brightcove::CmsApi.default_api.get_all('playlist').each do |p|
  playlist = Playlist.find_or_initialize_by(id: p["id"])
  playlist.update_attributes(
    account_id: p["account_id"],
    created_at: p["created_at"],
    updated_at: p["updated_at"],
    description: p["description"],
    favorite: p["favorite"],
    name: p["name"],
    reference_id: p["reference_id"],
    playlist_type: p["type"],
    video_ids: p["video_ids"],
  )

  playlist.save! if playlist.valid?
end

Playlist.find_each do |playlist|
  unless playlist.video_ids.nil?
    video_ids = playlist.video_ids.join(',')
    response = Brightcove::AnalyticsApi.default_api.get_videos(video_ids)
    details = JSON.parse(response.body)['summary']
    playlist.update_attributes(
      video_engagement_100: details['video_engagement_100'],
      video_engagement_75: details['video_engagement_75'],
      video_engagement_50: details['video_engagement_50'],
      video_engagement_25: details['video_engagement_25'],
      video_seconds_viewed: details['video_seconds_viewed'],
      video_impression: details['video_impression'],
      engagement_score: details['engagement_score'],
      video_engagement_1: details['video_engagement_1'],
      video_percent_viewed: details['video_percent_viewed'],
      play_request: details['play_request'],
      video_view: details['video_view'],
      play_rate: details['play_rate'],
    )
    playlist.save!
  end
end
