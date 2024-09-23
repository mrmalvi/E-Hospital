module Admin
  class HospitalsController < BaseController
    def index
      @hospitals = Hospital.all
    end

    def show
    end
  end
end
