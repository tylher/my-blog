class CommentsController < ApplicationController
def index
end

  def new
    @comment = Comment.new
    @current_user = current_user
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @post = Post.find(params[:post_id])
    @comment.post_id = params[:post_id]
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = ' Comments created successfully'
          current_post = Post.find(params[:post_id])
          @author = User.find(params[:user_id])
          redirect_to user_post_path(@author, current_post)
        else
          flash[:error] = 'Something went wrong'
          render :new
        end
      end
    end
  end

   def destroy
  @comment = Comment.find(params[:id])
  post = @comment.post
  author = @comment.author
  respond_to do |format|
    format.html do
      if @comment.destroy
        flash[:success] = 'Object successfully deleted'
        redirect_to user_post_path(post_id: post.id)
      else
        flash[:error] = 'Something went wrong'
          render :show, locals: { post: @post }
    end
    end
  end
 end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
