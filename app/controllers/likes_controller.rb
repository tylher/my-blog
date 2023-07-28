class LikesController < ApplicationController
  def new
    @likes = Like.new
  end

  def create
    @like = Like.new
    @like.author_id = current_user.id
    @post = Post.find(params[:post_id])
    @like.post_id = params[:post_id]
    respond_to do |format|
      format.html do
        if @like.save
          @like.update_like_count
          flash[:success] = " like created successfully"
          @author = User.find(params[:user_id])
          redirect_to user_post_path(@author, @post)
        else
          flash[:error] = "Something went wrong"
        end
      end
    end
  end
end
