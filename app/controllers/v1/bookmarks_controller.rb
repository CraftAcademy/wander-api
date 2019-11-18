class V1::BookmarksController < ApplicationController
  before_action :authenticate_user!, only: %i[index create destroy]
  before_action :get_trail, only: %i[create destroy]

  def index
    if current_user.bookmarked_trails.exists?
      render json: {
        data: ActiveModel::Serializer::CollectionSerializer.new(current_user.bookmarked_trails, serializer: TrailsSerializer) 
      }
    else 
      render_error_message('No bookmarks added.', 204)
    end
  end

  def create
    current_user.bookmarked_trails << @trail
    render json: {
      data: ActiveModel::Serializer::CollectionSerializer.new(current_user.bookmarked_trails, serializer: TrailsSerializer), 
      message: 'Saved trail to your bookmarks!'
    }
  end

  def destroy
    current_user.bookmarked_trails.destroy(@trail)
    render json: {
      data: ActiveModel::Serializer::CollectionSerializer.new(current_user.bookmarked_trails, serializer: TrailsSerializer), 
      message: 'Removed bookmark!'
    }
  end

  private

  def get_trail
    @trail = Trail.find_by_id(params[:trail_id])
  end

  def render_error_message(message, status) 
    render json: { error_message: message }, status: status
  end
end