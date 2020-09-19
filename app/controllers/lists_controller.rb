class ListsController < ApplicationController
before_action :set_post, only: [:create, :destroy]

def create
  @list = current_user.lists.create(post_id: params[:post_id])
  redirect_back(fallback_location: root_path)
end

def destroy
  @list = List.find_by(post_id: params[:post_id])
  @list.destroy
  redirect_back(fallback_location: root_path)
end


private
def set_post
  @post = Post.find(params[:post_id])
end
end