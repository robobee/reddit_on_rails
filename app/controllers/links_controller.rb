class LinksController < ApplicationController

  before_action :set_link, only: [:show, :vote]
  before_action :authenticate_user!, only: [:new, :create, :vote]
  
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
      render 'new'
    end
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @vote = @link.link_votes.where(user_id: current_user.id).first

    if @vote
      if @vote.value == value
        redirect_to @link, notice: 'You have already voted.'
      else
        @vote.update_attributes(value: value)
        redirect_to @link, notice: 'Thank you for voting.'
      end
    else
      link_vote = @link.link_votes.build(user_id: current_user.id, value: value)
      if link_vote.save
        redirect_to @link, notice: 'Thank you for voting.'
      else
        alert = "Something went wrong."
        alert = "You can't vote on your own links." if link_vote.errors[:user_id]
        redirect_to @link, alert: alert
      end
    end
  end

  private

    def links_params
      params.require(:link).permit(:url, :title)
    end
   
    def set_link
      @link = Link.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, alert: 'Something went wrong'
    end
end
