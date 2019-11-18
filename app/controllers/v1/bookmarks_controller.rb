class V1::BookmarksController < ApplicationController
  before_action :authenticate_user!, only: %i[index create destroy]
  before_action :get_trail, only: %i[create destroy]


  def index
    render json: current_user.bookmarked_trails, each_serializer: TrailsSerializer
  end

  def create
    current_user.bookmarked_trails << @trail
    render json: {message: 'yay!'}
  end

  def destroy
    current_user.bookmarked_trails.destroy(@trail)
  end

  private

  def get_trail
    @trail = Trail.find_by_id(params[:trail_id])
  end
end
