class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    title = params[:post][:title]
    body = params[:post][:body]

    Post.create title: title, body: body

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
end
