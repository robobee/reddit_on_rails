class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    @link = Link.find_by(id: params[:link_id])

    unless @link
      redirect_to root_path, alert: 'Something went wrong.'
    end

    @comment = current_user.comments.build(comment_params.merge! link_id: @link.id)
    if @comment && @comment.save
      redirect_to @link, notice: 'Comment was successfully added.'
    else
      @comments = @link.comments.includes(:user)
      render 'links/show'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
   
end
