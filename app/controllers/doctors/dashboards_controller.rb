module Doctors
  class DashboardsController < BaseController
    def show
      @all_appointments = begin
        patients = current_hospital.patients.group("date(patients.created_at)").count.sort.to_h
        {
          dates: patients.keys,
          series: [
            {name: "Patients", data: patients.values}
          ]
        }
      end
    end
  end
end
