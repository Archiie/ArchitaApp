class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  
  def index
  	@posts = Post.all.order(id: :desc)
  end

  def new
  	@post = current_user.posts.build
  end

  def create
  	@post = current_user.posts.build(post_params) #instead of Post.new, use "current_user.posts.build" after installing devise gem & creating first user by signing up

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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
  	params.require(:post).permit(:id, :title, :content)
  end
end
