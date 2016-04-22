class SpacesController < ApplicationController

  def new
    @space = current_user.owned_spaces.build
  end

  def edit
    @space = current_user.owned_spaces.find(params[:id])
  end

  def create
    @space = current_user.owned_spaces.build(space_params)
    if @space.save
      redirect_to root_path, notice: "Office Space is created successfully"
    else
      render :new
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :address, :description, :total_seats,
                                  :start_time, :end_time, { :amenities => [] }, :user_id)
  end
end
