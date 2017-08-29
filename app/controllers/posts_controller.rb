class PostsController < ApplicationController
	def index
		@posts = Post.all.order('created_at DESC')
		if params[:search]
    		@posts = Post.search(params[:search]).order("created_at DESC")
  		else
    		@posts = Post.all.order("created_at DESC")
  		end
	end

	def show
		@post = Post.find(params[:id]) 
		if params[:search]
    		@posts = Post.search(params[:search]).order("created_at DESC")
  		else
    		@posts = Post.all.order("created_at DESC")
  		end
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.save
  		redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end
	
	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to post_path(@post)
	end

	def post_params
  		params.require(:post).permit(:title, :body, :created_at, :image)
	end 
end
