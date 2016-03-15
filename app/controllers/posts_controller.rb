class PostsController < ApplicationController
  def index
  	@posts = Post.all.order(id: :desc)
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)

  	if @post.save
  		redirect_to posts_path
  	else
  		render 'new'
  	end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  		redirect_to post_path(@post)
  	else
  		render 'Edit'
  	end
  end

  private
  def post_params
  	params.require(:post).permit(:id, :title, :content)
  end
end
