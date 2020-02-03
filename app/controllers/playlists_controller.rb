class PlaylistsController  < ApplicationController
  # TODO: Add authentication
  def index
    render json: Playlist.all.order(:created_at)
  end

  def show
    render json: Playlist.find(params[:id])
  end
end
