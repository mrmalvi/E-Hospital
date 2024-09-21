module Doctors
  class BaseController < ApplicationController
    before_action :authenticate_doctor!
    before_action :current_hospital

    helper_method :current_hospital

    def current_hospital
      @current_hospital ||= current_doctor&.hospital
    end
  end
end
