class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash.notice = "Post was successfully created."
      refresh_or_redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash.notice = "post was successfully updated."
      refresh_or_redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash.notice = "Post was successfully deleted."
    refresh_or_redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
