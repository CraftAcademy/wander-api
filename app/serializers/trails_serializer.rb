class TrailsSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :intensity, :duration, :city, :country, :extra, :image, :continent, :coordinates, :user_id, :likes

  def likes
    object.likes.count
  end
  
  def coordinates
    object.coordinates.map do |coords|
    {latitude: coords[:latitude], longitude: coords[:longitude]}
    end
  end

  def image
    if Rails.env.test?
      rails_blob_url(object.image, only_path: :true)
    else
      object.image.service_url(expires_in: 1.hours, disposition: 'inline')
    end
  end
end