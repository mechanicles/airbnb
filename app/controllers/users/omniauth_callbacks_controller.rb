class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    current_user.store_omniauth_credentials(request.env["omniauth.auth"])

    if current_user.connected_to?('facebook')
      redirect_to user_profile_edit_path, notice: 'Connected to facebook successfully'
    end
  end


  def failure
    redirect_to root_path
  end

end
