require 'csv'

class PlaylistData
  def self.to_csv
    playlist_attributes = %w{ id name video_ids description }
    data_attributes = %w{
      video_engagement_100 video_engagement_75 video_engagement_50 video_engagement_25
      video_seconds_viewed video_impression engagement_score video_engagement_1 video_percent_viewed
      play_request video_view play_rate
    }

    CSV.generate(headers: true) do |csv|
      csv << playlist_attributes + data_attributes
      Playlist.all.each do |playlist|
        values = playlist_attributes.map { |attr| playlist.try(attr) }
        data_values = data_attributes.map { |attr| playlist.data_points.last.try(attr) }
        csv << values + data_values
      end
    end
  end
end
