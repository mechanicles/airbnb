class SpacesController < ApplicationController

  before_action :check_user_profile_completion

  def new
    @space = current_user.owned_spaces.build
    @space.build_address
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
    params.require(:space).permit(:name, :description, :total_seats, :start_time,
                                  :cost_per_seat_per_day, :cost_per_seat_per_week,
                                  :cost_per_seat_per_month, :end_time,
                                  { amenities: [] }, :user_id, :featured,
                                  { address_attributes: [:street1, :street2, :city,
                                                       :state, :country] },
                                  { pictures: [] } )
  end

  def check_user_profile_completion
    unless current_user.profile_completed?
      msg = "To create a new space, first you need to complete your profile!"
      redirect_to user_profile_edit_path, alert: msg
    end
  end

end
