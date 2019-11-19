class V1::CoordinatesController < ApplicationController
  def create
    @trails = Trail.new(trail_params)
    params[:coordinates].each do |coordinate|
    @trail.coordinates.create()
    end
  end
end