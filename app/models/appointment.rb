class Appointment < ApplicationRecord
  validates :date, presence: true

  belongs_to :doctor
  belongs_to :patient
  belongs_to :hospital
  before_validation :set_defaults

  scope :date_asc, -> { order(date: :asc) }

  def upcoming?
    if start_time && ((date > Date.current) || (date == Date.current && start_time.strftime("%H:%M:%S") > Time.current.strftime("%H:%M:%S")))
      true
    end
  end

  def slot_time
    "#{start_time.strftime("%I:%M %p")} - #{end_time.strftime("%I:%M %p")}" if start_time? && end_time?
  end

  def formated_start_time
    "#{start_time&.strftime("%I:%M %p")}"
  end

  def formated_end_time
    "#{end_time&.strftime("%I:%M %p")}"
  end

  private
    def set_defaults
      self.hospital ||= doctor&.hospital
    end
end
