class Appointment < ApplicationRecord
  validates :date, presence: true

  belongs_to :doctor
  belongs_to :patient
  belongs_to :hospital
  before_validation :set_defaults

  scope :date_asc, -> { order(date: :asc) }

  def slot_time
    "#{start_time.strftime("%I:%M %p")} - #{end_time.strftime("%I:%M %p")}" if start_time? && end_time?
  end

  private
    def set_defaults
      self.hospital ||= doctor&.hospital
    end
end
