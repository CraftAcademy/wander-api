class V1::UsersController < ApplicationController
  def show #users bookmarks 
    @user = User.find_by_id(params[:user_id])
    render @user.id.bookmarks
  end
end
