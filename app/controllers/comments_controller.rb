class CommentsController < ApplicationController
  def new
    if params[:object_type] == "link"
      @comment = Link.find(params[:link_id]).comments.new
    else
      @comment = Comment.find(params[:comment_id]).comments.new
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save  
      redirect_to root_url, notice: "Comment successfully added!"
    else
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :commentable_id, :commentable_type)
    end
end