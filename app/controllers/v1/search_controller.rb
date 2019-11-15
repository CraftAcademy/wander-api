class V1::SearchController < ApplicationController

  def index
    if params['search'].present?
      trails = Trail.search(params['search']).records.all
      render json: trails, each_serializer: TrailsSerializer
    end
  end

end
