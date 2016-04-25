class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    if current_user
      current_user.store_omniauth_credentials(request.env["omniauth.auth"])
      if current_user.connected_to?('facebook')
        redirect_to user_profile_edit_path, notice: 'Connected to facebook successfully'
      else
        redirect_to root_path, notice: 'Not connect to facebook'
      end
    else
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end

  def failure
    redirect_to root_path
  end

end
