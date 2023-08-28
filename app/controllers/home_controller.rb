class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pagy, @posts = pagy(Post.all.order(id: :asc))
  end
end
