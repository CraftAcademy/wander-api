class V1::UsersController < ApplicationController
  def show #users bookmarks 
    @user = User.find_by_id(params[:user_id])
    render @user.trail_bookmarks
  end
end