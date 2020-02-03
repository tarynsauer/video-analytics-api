class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :video_ids, :playlist_type, :description,
    :created_at, :updated_at, :last_data_point, :all_data_points

  private

  def last_data_point
    self.object.data_points.last
  end

  def all_data_points
    self.object.data_points
  end
end
