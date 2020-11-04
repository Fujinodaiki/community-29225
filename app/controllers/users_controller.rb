class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @apply = Apply.all
    @count = 0
  end
end
