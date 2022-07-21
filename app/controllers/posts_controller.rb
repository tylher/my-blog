class PostsController < ApplicationController
  def show; end

  def index
    @posts = Post.where(author_id: params[:user_id])
  end
end
