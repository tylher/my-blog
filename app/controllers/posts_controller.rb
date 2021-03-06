class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.where(author_id: params[:user_id])
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = Post.new(post_params)
    @current_user = current_user
    @post.author_id = @current_user.id
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Object successfully created'
          redirect_to user_posts_path(@current_user)
        else
          flash[:error] = 'Something went wrong'
          render :new, locals: { post: @post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
