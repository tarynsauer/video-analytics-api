class Playlist < ApplicationRecord
  self.primary_key = :id
  has_many :data_points, dependent: :destroy
end
