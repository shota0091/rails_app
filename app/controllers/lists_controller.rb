class ListsController < ApplicationController
before_action :set_post
before_action :authenticate_user!

  def create
    @list = current_user.lists.create(post_id: params[:post_id])
  end

  def destroy
    @list = List.find_by(post_id: params[:post_id],user_id: current_user.id)
    @list.destroy
  end


private
    def set_post
      @post = Post.find(params[:post_id])
    end
end