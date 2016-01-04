class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])

    comment_body = params[:comment][:body]

    post.comments.create body: comment_body

    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to post_path(post) }
    end
  end
end
