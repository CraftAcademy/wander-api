class V1::BookmarksController < ApplicationController
  def create #creates a bookmark associated with current user and current trail
    @trail = Trail.find_by_id(params[:trail_id])
    @user = User.find_by_id(params[:user_id])
    bookmark = Bookmark.create(user_id: @user.id, trail_id: @trail.id) 
    render json: bookmark 
  end

  def index #trails bookmarks, shows a trails bookmarks
    trail = Trail.find_by_id(params[:trail_id])
    if trail.bookmarks.exists?
      bookmarks = Bookmark.all
      render json: bookmarks
    else
      render_error_message('There are no saved trails here - go back.', 400 )
    end
  end

  def show 
    if Bookmark.exists?(id: params[:id])
      bookmark = Bookmark.find(params[:id])
      render json: bookmark
    else
      render_error_message('There are no saved trails here - go back.', 400 )
    end
  end

  private

  def render_error_message(message, status) 
    render json: { error_message: message }, status: status
  end
end
