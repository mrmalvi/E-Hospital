module Admin
  class DoctorsController < BaseController
    before_action :set_hospital
    before_action :set_doctor, only: %i[show, new, edit, destroy, update]

    def index
      @doctors = @hospital.doctors
    end

    def show
    end

    private
      def set_doctor
        @doctor = @hospital.doctors.find(id: params[:id])
      end

      def set_hospital
        @hospital = Hospital.find(id: params[:hospital_id])
      end
  end
end
