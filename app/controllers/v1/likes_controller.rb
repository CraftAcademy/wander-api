class V1::LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :get_trail, only: %i[create index destroy]

  def create
    like = Like.create(trail_id: params[:trail_id], user_id: current_user.id)
    if like.save
      render json: @trail, serializer: TrailsSerializer
    else
      render_error_message('Done goofed', 400)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render json:  @trail, serializer: TrailsSerializer
  end

  private

  def get_trail
    @trail = Trail.find_by_id(params[:trail_id])
  end

  def like_params
    params.permit(:user_id, :trail_id)
  end

  def render_error_message(message, status) 
    render json: { error_message: message }, status: status
  end
end