class PagesController < ApplicationController
  
  def index
    @links = Link.by_votes.page(params[:page] || 1)
  end
  
end
