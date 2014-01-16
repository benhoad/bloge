class PostsController < ApplicationController
  def index
    @posts = Post.limit(10).order('published_at desc')
  end

  def show
    @post = Post.find(params[:id])

  end
end