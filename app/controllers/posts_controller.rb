class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = Post.find_by(title: params[:title])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = 1
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = "Post successfully created"
          redirect_to posts_path
        else
          flash[:error] = "Something went wrong"
          render :new, locals: { post: @post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :featured_image)
  end
end
