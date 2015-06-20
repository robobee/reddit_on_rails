class PagesController < ApplicationController
  
  def index
    pg = params[:page].present? ? params[:page] : 1
    @links = Link.text_search(params[:query]).by_votes.page(pg)
  end
  
end
