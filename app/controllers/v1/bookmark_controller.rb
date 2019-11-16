class BookmarkController < ApplicationController
  def build 
    @trail = Trail.find_by_id(params[:trail_id])
    @user = User.find_by_id
    @trail.users << @user
  end
end
