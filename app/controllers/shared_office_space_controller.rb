class SharedOfficeSpaceController < ApplicationController

  def detail
    @space = Space.find(params[:space_id])
  end

  def book
    @shared_space = SharedOfficeSpace.new(shared_office_space_params)
    @space = Space.find(shared_office_space_params[:space_id])

    if @shared_space.save
      message = "Space booked successfully"
      redirect_to shared_office_space_detail_path(space_id: @space.id), notice: message
    else
      render :detail
    end
  end

  def update
    current_user.update_attributes(user_profile_params)
    redirect_to user_profile_edit_path, notice: "Profile is updated successfully"
  end

  private

  def shared_office_space_params
    params.require(:shared_office_space).permit(:user_id, :space_id, :publicly_shared)
  end
end
