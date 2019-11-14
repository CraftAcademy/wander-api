class SearchController < ApplicationController
  def index
    trails = Trails.search(params['search']).record.all
    render json: trails
  end
end