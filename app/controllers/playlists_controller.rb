class PlaylistsController  < ApplicationController
  def index
    json_response Brightcove::CmsApi.default_api.get_all('playlist')
  end

end
