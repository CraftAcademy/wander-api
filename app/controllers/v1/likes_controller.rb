class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :get_track

  def create
    @track.like.create(user_id: current_user.id)
    render json: {
      data: ActiveModel::Serializer::CollectionSerializer.new(current_user., serializer: TrailsSerializer) 
    }
    
  end

  private

  def find_track
    @track = Track.find(params[:track_id])
  end

end
