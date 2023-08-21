class HomeController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.all)
  end
end
