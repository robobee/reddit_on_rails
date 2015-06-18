class LinksController < ApplicationController

  before_action :set_link, only: [:show, :edit]
  
  def index
  end

  def show
  end

  def new
    @link = Link.new
  end

  def create
    link = current_user.links.build(links_params)
    if link.save
      redirect_to link, notice: 'Link was successfully created.'
    else
      @link = Link.new
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

    def links_params
      params.require(:link).permit(:url, :title)
    end
   
    def set_link
      @link = Link.find(params[:id])
    end
end
