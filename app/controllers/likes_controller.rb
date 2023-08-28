class LikesController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    @post = Post.find(params[:post_id])
    puts user_signed_in? == false
    if !@post.liked?(current_user)
      @post.like(current_user)
    else
      @post.unlike(current_user)
    end
    @updated_post = Post.find(params[:post_id])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(dom_id(@updated_post, :likes), partial: "posts/likes", locals: { post: @updated_post })
      end
    end
  end
end
