class V1::TrailsController < ApplicationController
  def index 
    trails = Trail.all

    if trails.empty?
      render_error_message('No trails here, turn around.', 400)
    else
      render json: trails, each_serializer: TrailsSerializer
    end
  end

  def create
    trail = Trail.create(trail_params)

    if trail.persisted?
      render json: {message: 'Trail was successfully created'}
    elsif (trail.title).length < 5 || (trail.description).length < 15
      render_error_message('Please add more content', 400)
    else
      render_error_message('Please add content to all fields', 400)
    end   
  end

  def show
    if Trail.exists?(id: params[:id])
      trail = Trail.find(params[:id])
      render json: trail, serializer: TrailsSerializer
    else
      render_error_message('There is no trail here go back.', 400 )
  end
end

  private

  def trail_params
    params.permit(:title, :description, :intensity, :extra, :duration, :location)
  end

  def render_error_message(message, status) 
    render json: { error_message: message }, status: status
  end
end