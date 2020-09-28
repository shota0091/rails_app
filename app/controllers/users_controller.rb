class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
  @posts = @user.posts
end

def eidt
  @user = User.find(params[:id])
  if @user = current_user
    render "edit"
  else
    redirect_to users_path
  end
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to "/users/#{current_user.id}"
  else
    render :edit
  end
end


def mylist
  @user = User.find(params[:id])

  @list = List.new
  @lists = @user.lists.includes(:user)
end

def history
  @user = User.find(params[:id])
  @post = Post.new
  @posts = @user.posts.includes(:user)

end

private
  def user_params
    params.require(:user).permit(:name, :email, :image, :UserBody)
  end
end
