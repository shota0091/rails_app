class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      else
        render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    impressionist(@post, nil, unique: [:session_hash])
    @random = Post.limit(20)
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @comments_count = Comment.where(post_id: @post.id).count
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path(@post)
      else
        render :new
    end
  end

  def terms
  end

  def search
    @posts = Post.search(params[:keyword])
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :video).merge(user_id: current_user.id)
  end
end