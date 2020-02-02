module Brightcove
  class Fetch < self
    def playlist_cms
      Brightcove::CmsApi.default_api.get_all('playlist').each do |payload|
        playlist = Playlist.find_or_initialize_by(id: payload["id"])
        playlist.cms_update!(payload)
      end
    end

    def playlist_analytics
      Playlist.find_each do |playlist|
        if !playlist.video_ids.nil?
          video_ids = playlist.video_ids.join(',')
          response = Brightcove::AnalyticsApi.default_api.get_videos(video_ids)
          payload = JSON.parse(response.body)['summary']
          playlist.analytics_update!(payload)
        end
      end
    end
  end
end
