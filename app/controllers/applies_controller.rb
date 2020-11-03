class AppliesController < ApplicationController
  def create
    @apply = Apply.new(applies_params)
    if @apply.save
      redirect_to root_path
    else
      rendirect_to root_path
    end
  end

  private
  def applies_params
    params.permit(:room_id,:user_id)
  end

end
