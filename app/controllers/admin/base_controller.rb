module Admin
  class BaseController < ApplicationController
    layout "admin"
    before_action :authenticate_doctor!
    before_action :ensure_admin!

    def ensure_admin!
      if !current_doctor.admin?
        sign_out current_doctor
        redirect_to root_path
      end
    end
  end
end
