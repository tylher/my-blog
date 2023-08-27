class HomeController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.all.order(id: :asc))
  end
end
