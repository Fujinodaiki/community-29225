class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @room = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @search = Room.search(params[:keyword]) 
  end

  private

  def room_params
    params.require(:room).permit(:name, :category, :comment,user_ids: []).merge(user_id: current_user.id)
  end
end

