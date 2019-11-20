class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :find_trail

  

end
