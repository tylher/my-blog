class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.user_id = 1
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @post = Post.find(params[:post_id])
    @comment.post_id = params[:post_id]

    if @comment.save
      @updated_post = @comment.post
      respond_to do |format|
        format.html { flash[:success] = " Comments created successfully" }
        format.turbo_stream
      end
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
