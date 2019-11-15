class Trail < ApplicationRecord
  validates_presence_of :title, :description, :intensity, :duration, :location, :latitude, :longitude
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 15 }
  has_one_attached :image

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks


  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :description, type: :text, analyzer: :english
      indexes :location, type: :text, analyzer: :english
    end
  end

  def as_indexed_json(options = {})
    self.as_json(
      options.merge(
        only: [:title, :description, :location]
      )
    )
  end
end