class V1::LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :get_trail, only: %i[create destroy]

  def create
  
    binding.pry
    @like = Like.new(like_params)
    @trail.user_likes << @like
    if @like.save
      render json: {
        data: ActiveModel::Serializer::CollectionSerializer.new(@trail.user_likes, serializer: TrailsSerializer) 
      }
    else
      render_error_message('Done goofed', 400)
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    render json: {
      data: ActiveModel::Serializer::CollectionSerializer.new(@trail.user_likes, serializer: TrailsSerializer) 
    }
  end

  private

  def get_trail
    @trail = Trail.find_by_id(params[:id])
  end

  def like_params
    params.permit(:value, :user_id, :id)
  end

  def render_error_message(message, status) 
    render json: { error_message: message }, status: status
  end
end