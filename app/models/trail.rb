class Trail < ApplicationRecord
  validates_presence_of :title, :description, :intensity, :duration, :location, :latitude, :longitude
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 15 }
  has_one_attached :image

  include Elasticsearch::Model 
  include Elasticsearch::Model::Callbacks

  include Rails.application.class.module_parent_name.underscore
  document_type self.name.downcase

  settings index: { number_of_shards: 1 } do 
    mapping dynamic: false do
      indexes :title, analyzer: 'english'
      indexes :description, analyzer: 'english'
      indexes :location, analyzer: 'english'
    end
  end

  def as_indexed_json(options = nil)
    self.as_json( only: [ :title, :description, :location ] )
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^5', 'description', 'location']
          }
        },
        highlight: {
          pre_tags: ['<mark>'],
          post_tags: ['</mark>'],
          fields: {
            title: {},
            description: {},
            location: {},
          }
        }
    }
  )
  end
end