class LinksController < ApplicationController

  before_action :set_link, only: [:show]
  before_action :authenticate_user!, only: [:new, :create]
  
  def show
    @comment = @link.comments.build
    @comments = @link.comments.includes(:user)
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(links_params)
    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      @link = Link.new
      render 'new'
    end
  end

  private

    def links_params
      params.require(:link).permit(:url, :title)
    end
   
    def set_link
      @link = Link.find(params[:id])
    end
end
