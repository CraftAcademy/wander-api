class V1::SearchController < ApplicationController
  def index 
    if params['search'].present?
      trails = Trail.search(params['search']).records.all
      render json: trails, each_serializer: TrailsSerializer
    else
      render_error_message('Please enter valid search input', 204)
    end
  end

  private

  def render_error_message(message, status) 
    render json: { error_message: message }, status: status
  end

end