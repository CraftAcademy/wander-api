class V1::TrailsController < ApplicationController
  def index 
    trails = Trail.all

    if trails.empty?
      render_error_message('No trails here, turn around.', 400)
    else
      render json: trails
    end
  end

  private 
  render_error_message(message, status) do
    render json: {error_message: message, status: status}
  end
end
