class UserProfileController < ApplicationController

  def edit
    @user = current_user
    @user.address || @user.build_address
  end

  def update
    @user = current_user

    if @user.update_attributes(user_profile_params)
      redirect_to user_profile_edit_path, notice: "Profile is updated successfully"
    else
      render :edit
    end
  end

  private

  def user_profile_params
    params.require(:user).permit(:phone_number, :description, :company_name,
                                 address_attributes: [:street1, :street2, :city,
                                                      :state, :country])
  end
end
