class FetchPlaylistAnalyticsJob < ApplicationJob
  queue_as :default

  def perform(args)
    response = Brightcove::AnalyticsApi.default_api.get_videos(args[:video_ids])
    payload = JSON.parse(response.body)['summary']

    DataPoint.create!(
      playlist_id: args[:playlist_id],
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
