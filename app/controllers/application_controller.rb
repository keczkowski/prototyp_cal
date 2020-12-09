class ApplicationController < ActionController::Base

  def is_verified
    unless current_user.present? and current_user.verified == true
      redirect_to root_path
    end
  end

  def has_access_to_users
    unless current_user.present? and current_user.verified == true and current_user.access_users == true
      redirect_to root_path
    end
  end

end
