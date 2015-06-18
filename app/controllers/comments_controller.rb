class CommentsController < ApplicationController

  def create
    link = Link.find_by(id: params[:link_id])

    unless link
      redirect_to root_path, alert: 'Something went wrong.'
    end

    comment = current_user.comments.build(comment_params.merge! link_id: link.id)
    if comment && comment.save
      redirect_to link, notice: 'Comment was successfully added.'
    else
      redirect_to link, notice: 'Something went wrong.'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
   
end