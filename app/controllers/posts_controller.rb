class PostsController < ApplicationController
  before_action :check_setup

  def index
    @posts = Post.limit(10).order('published_at desc')
  end

  def show
    @post = Post.find(params[:id])

  end

  private
    def check_setup
      unless User.any?
        redirect_to setup_index_path
        return false
      end
    end
end