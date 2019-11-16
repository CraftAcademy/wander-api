class V1::BookmarkController < ApplicationController
  def create #creates a bookmark associated with current user and current trail
    @trail = Trail.find_by_id(params[:trail_id])
    @user = User.find_by_id(params[:user_id])
    @trail.bookmarks.create(@user) 
    render trail_bookmarks 
  end

  def index #trails bookmarks, shows a trails bookmarks
    @trail = Trail.find_by_id(params[:trail_id])
    render @trail.bookmarks
  end
end
