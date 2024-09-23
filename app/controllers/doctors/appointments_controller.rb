module Doctors
  class AppointmentsController < BaseController
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
      @appointments = current_hospital.appointments.date_asc
      @appointments = @appointments.joins(:patient, :doctor).where("lower(patients.name) LIKE ? OR lower(doctors.name) LIKE ?", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%") if params[:query].present?
    end

    def new
      @patient = current_hospital.patients.new
    end

    def create
      @patient = current_hospital.patients.new(patient_params)
      appointment = @patient.appointments.build(appointment_params)
      appointment.hospital = current_hospital
      if @patient.save
        redirect_to doctors_appointments_path, notice: "appointment has been successfully created."
      else
        flash[:error] = "#{@patient.errors.full_messages.to_sentence}, #{appointment.errors.full_messages.to_sentence}"
        render :new
      end
    end

    def edit
    end

    def update
      if @patient.update(patient_params) && @appointment.update(appointment_params)
        redirect_to doctors_appointments_path, notice: 'Appointment has been updated successfully.'
      else
        flash[:error] = "#{@patient.errors.full_messages.to_sentence}, #{@appointment.errors.full_messages.to_sentence}"
        render :edit
      end
    end

    def destroy
      if @appointment.destroy
        redirect_to doctors_appointments_path, notice: 'Appointment has been successfully destroyed.'
      else
        flash[:error] = @appointment.errors.full_messages.to_sentence
        redirect_to doctors_appointments_path
      end
    end

    private
      def set_appointment
        @appointment = current_hospital.appointments.find(params[:id])
        @patient = @appointment.patient
      end

      def patient_params
        params.required(:patient).permit(:name, :email, :phone, :image).compact_blank
      end

      def appointment_params
        params.permit(:doctor_id, :date, :start_time, :end_time).compact_blank
      end
  end
end
