class UsersController < ApplicationController
  before_action :set_user

def show
  @posts = @user.posts
end

def eidt
  if @user.id = current_user
  else
    render users_path
  end
end

def update
  if @user.update(user_params)
    redirect_to "/users/#{current_user.id}",notice: 'ユーザー情報を更新しました'
  else
    render :edit
  end
end


def mylist
  @list = List.new
  @posts = @user.lists.includes(:user).page(params[:page]).per(3)
end

def history
  @post = Post.new
  @posts = @user.posts.includes(:user).page(params[:page]).per(3)
end

private
  def user_params
    params.require(:user).permit(:name, :email, :image, :UserBody)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
