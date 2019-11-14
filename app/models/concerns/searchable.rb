module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model 
    include Elasticsearch::Model::Callbacks
    
    mapping do
      Trail.__elasticsearch__.create_index!
      Trail.import
    end
    
    def self.search(query)
      @trails = Trail.search(query).records
    end
  end
end