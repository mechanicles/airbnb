class UserProfileController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes(user_profile_params)
    redirect_to user_profile_edit_path, notice: "Profile is updated successfully"
  end

  private

  def user_profile_params
    params.require(:user).permit(:phone_number, :description, :address, :company_name)
  end
end
