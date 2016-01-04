class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 3)

    respond_to do |format|
      format.html
      format.json { render text: @posts.to_json }
    end
  end

  def create
    post = Post.create post_params

    flash[:notice] = "Successfully created post"

    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])

    title = params[:post][:title]
    body = params[:post][:body]

    post.title = title
    post.body = body

    post.save

    flash[:notice] = "Updated  post"

    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    flash[:notice] = "Deleted post"

    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    params[:post].permit(:title, :body, :image)
  end
end
