class V1::TrailsController < ApplicationController
  def index 
    trails = Trail.all
    if trails.empty?
      render_error_message('No trails here, turn around.', 400)
    else
      render json: {
        data: ActiveModel::Serializer::CollectionSerializer.new(trail, serializer: TrailsSerializer)
      }
    end
  end

  def create
    @trail = Trail.new(trail_params.merge!(user: current_user))
    params[:coordinates].each do |coordinate|
      @trail.coordinates.new(latitude: coordinate[:latitude], longitude: coordinate[:longitude])
    end
    if @trail.save
      attach_image
      if @trail.persisted? && @trail.image.attached?
        render json: {
          data: TrailsSerializer.new(@trail),
          message: 'Trail was successfully created'
        }
      else
        render_error_message('Image attachment was unsuccessful', 400)
      end
    elsif (@trail.title).length < 5 || (@trail.description).length < 15
      render_error_message('Please add more content', 400)
    else
      render_error_message('Please add content to all fields', 400)
    end
  end 

  def show
    if Trail.exists?(id: params[:id])
      trail = Trail.find(params[:id])
      render json: {
        data: ActiveModel::Serializer.new(trail, serializer: TrailsSerializer)
      }
    else
      render_error_message('There is no trail here go back.', 400 )
  end
end

  private

  def trail_params
    params.permit(:title, :description, :intensity, :extra, :duration, :location, :continent, keys: [:image])
  end

  def render_error_message(message, status) 
    render json: { error_message: message }, status: status
  end

  def attach_image
    if params['image'] && params['image'].present?
      DecodeService.attach_image(params['image'], @trail.image)
    end
  end
end