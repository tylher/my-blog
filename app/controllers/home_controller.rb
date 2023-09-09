class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pagy, @posts = pagy(Post.where(published: true).order(id: :asc))
  end
end
