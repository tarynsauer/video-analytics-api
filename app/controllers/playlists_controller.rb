class PlaylistsController  < ApplicationController
  # TODO: Add authentication
  def index
    json_response Playlist.all
  end

  def show
    json_response Playlist.find(params[:id])
  end
end
