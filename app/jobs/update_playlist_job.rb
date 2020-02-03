class UpdatePlaylistJob < ApplicationJob
  queue_as :default

  def perform(payload)
    playlist = Playlist.find_or_initialize_by(id: payload["id"])
    playlist.assign_attributes(
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
    playlist.save! if playlist.changed?
  end
end
