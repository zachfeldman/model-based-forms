class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[:user_id])
  end
end