class V1::TrailsController < ApplicationController
  def index 
    trails = Trail.all
  end
end
