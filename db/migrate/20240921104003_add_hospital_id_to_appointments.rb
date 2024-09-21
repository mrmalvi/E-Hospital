class AddHospitalIdToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :hospital_id, :integer
    add_column :doctors, :hospital_id, :integer
  end
end
