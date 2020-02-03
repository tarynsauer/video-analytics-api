module Brightcove
  class Fetch
    def self.playlist_cms
      Brightcove::CmsApi.default_api.get_all('playlist').each do |payload|
        UpdatePlaylistJob.perform_later(payload)
      end
    end

    def self.playlist_analytics
      Playlist.find_each do |playlist|
        unless playlist.video_ids.nil?
          video_ids = playlist.video_ids.join(',')
          FetchPlaylistAnalyticsJob.perform_later(playlist_id: playlist.id, video_ids: video_ids)
        end
      end
    end
  end
end
