class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  def after_sign_in_path_for(resource)
    if resource.is_a?(Doctor)
      if resource.admin?
        stored_location_for(resource) || admin_dashboard_path
      elsif resource.receptionist?
        stored_location_for(resource) || doctors_appointments_path
      else
        stored_location_for(resource) || doctors_dashboard_path
      end
    else
      root_path
    end
  end
end
