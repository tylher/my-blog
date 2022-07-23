class CommentsController < ApplicationController
    def new
        @comment = Comment.new
        @comment.post_id = params[:post_id]
        @comment.author_id = current_user.id
    end

    def create
         @comment = Comment.new(comment_params)
         respond_to do |format|
            format.html do
                if @comment.save
                    flash[:success] = " Comments created successfully"
                    redirect_to user_post_comments_path
                else
                    flash[:error] = "Something went wrong"
                    render :new
                end
            end
         end
    end

    private
    def comment_params
        params.require(:comment).permit(:text)
    end
end