class SearchController < ApplicationController
  def search 
    unless params[:query].blank?
      @results = Trail.search( params[:query] )
    end
  end
end