class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :hospital
  before_validation :set_defaults

  private
    def set_defaults
      self.hospital ||= doctor&.hospital
    end
end
