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

private
  def user_params
    params.require(:user).permit(:name, :email, :image, :UserBody)
  end
end
