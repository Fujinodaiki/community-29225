class RoomUsersController < ApplicationController
  def create
    @room_user = RoomUser.new(apply_params)
    if @room_user.save
      Apply.find(params[:apply_id]).destroy
      redirect_to root_path
    end
  end

  def apply_params
    params.permit(:room_id,:user_id)
  end
end
