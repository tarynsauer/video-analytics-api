class VideosController  < ApplicationController
  def index
    json_response Brightcove::AnalyticsApi.default_api.get_videos(params[:ids])
  end
end
