module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model 
    include Elasticsearch::Model::Callbacks
    
  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :description, type: :text, analyzer: :english
      indexes :location, type: :text, analyzer: :english
      indexes :events do
        indexes :title, type: :text, analyzer: :english
        indexes :description, type: :text, analyzer: :english
        indexes :location, type: :text, analyzer: :english
      end
    end
  end

  def as_indexed_json(options = {})
    self.as_json(
      options.merge(
        only: [:title, :description, :location],
        include: { events: { only: [:title, :description, :location] } }
      )
    )
  end
end
#have to do `post.import force: true`