class V1::TrailsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def index 
    if params[:continent].present?
      trails = Trail.where(continent: params[:continent])
      render json: ActiveModel::Serializer::CollectionSerializer.new(trails, serializer: TrailsSerializer)
    elsif params[:search].present?
      filtered_trails = SearchService.search(params[:search])
      render json: ActiveModel::Serializer::CollectionSerializer.new(filtered_trails, serializer: TrailsSerializer)
    else
    trails = Trail.all
      if trails.empty?
        render_error_message('No trails here, turn around.', 400)
      else
        render json: ActiveModel::Serializer::CollectionSerializer.new(trails, serializer: TrailsSerializer)
      end
    end
  end

  def create
    @trail = Trail.new(trail_params.merge!(user: current_user))
    if params[:coordinates].present?
      params[:coordinates].each do |coordinate|
        @trail.coordinates.new(latitude: coordinate[:latitude], longitude: coordinate[:longitude])
      end
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
      render json: trail, serializer: TrailsSerializer
    else
      render_error_message('There is no trail here go back.', 400 )
  end
end

  private

  def trail_params
    params.permit(:title, :description, :intensity, :extra, :duration, :city, :country, :continent)
  end

  def render_error_message(message, status) 
    render json: { error_message: message }, status: status
  end

  def attach_image
    if params['image'] && params['image'].present?
      DecodeService.attach_image(params['image'][0], @trail.image)
    end
  end
end