class TrailsSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :intensity, :duration, :location, :extra, :image

  def image
    if Rails.env.test?
      rails_blob_url(object.image)
    else
      object.image.service_url(expires_in: 1.hours, disposition: 'inline')
    end
  end
end