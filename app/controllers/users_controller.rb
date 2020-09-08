class UsersController < ApplicationController
def show
  @User = user.find(id: params[:id])
end
end
