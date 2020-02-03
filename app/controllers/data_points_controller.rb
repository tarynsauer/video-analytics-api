class DataPointsController  < ApplicationController
  # TODO: Add authentication
  def show
    data_points = DataPoint.where(params[:playlist_id]).order(:created_at)
    render json: data_points
  end
end
