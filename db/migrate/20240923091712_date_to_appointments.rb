class DateToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :date, :datetime
    add_column :appointments, :start_time, :time
    add_column :appointments, :end_time, :time
  end
end
