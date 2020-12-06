class PostsController < ApplicationController
  #before_action :set_post,only: [:show, :destroy,:edit,:update]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(9)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path,notice: '動画を投稿しました'
    else
      render :new
    end
  end

  def show

    impressionist(@post, nil, unique: [:session_hash])
    @random = Post.limit(20)
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
    @comments_count = Comment.where(post_id: @post.id).count
  end
  
  def destroy

    @post.destroy
    redirect_to posts_path,notice: '動画を削除しました'
  end

  def edit

  end

  def update

    if @post.update(post_params)
      redirect_to posts_path(@post),notice: '動画を更新しました'
    else
      render :edit
    end
  end

  def terms
  end

  def search
    @posts = Post.search(params[:keyword])
    @posts = @posts.page(params[:page]).per(9)
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :video).merge(user_id: current_user.id)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end