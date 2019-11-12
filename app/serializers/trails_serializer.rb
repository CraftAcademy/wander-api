class TrailsSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :intensity, :duration, :location, :extra
end