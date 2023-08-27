class LikesController < ApplicationController
  include ActionView::RecordIdentifier
  respond_to :turbo_stream

  def create
    @like = Like.new
    @like.author_id = current_user.id
    @post = Post.find(params[:post_id])
    @like.post_id = params[:post_id]
    if @like.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(dom_id(@post, :likes), partial: "posts/likes", locals: { post: @post })
        end
      end
    end
  end
end
