class V1::BookmarksController < ApplicationController
  def create #creates a bookmark associated with current user and current trail
    @trail = Trail.find_by_id(params[:trail_id])
    @user = User.find_by_id(params[:user_id])
    bookmark = Bookmark.create(user: @user, trail: @trail) 
    render json: bookmark 
  end

  def index #trails bookmarks, shows a trails bookmarks
    @trail = Trail.find_by_id(params[:trail_id])
    render @trail.bookmarks
  end
end
