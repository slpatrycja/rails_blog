class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at desc')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(params[:post].permit(:title, :content))
    redirect_to action: 'index'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    
    redirect_to action: 'index'
  end

end
