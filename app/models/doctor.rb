class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  REQUIRED_HOSPITAL_ROLES = ["doctor", "receptionist"]
  enum role: { doctor: 'doctor', admin: 'admin', receptionist: "receptionist" }

  validate :check_hospital

  belongs_to :hospital, optional: true

  has_many :appointments
  has_many :patients, through: :appointments

  def email_required?
    false
  end

  def password_required?
    false
  end

  private
    def check_hospital
      if !hospital_id && REQUIRED_HOSPITAL_ROLES.include?(role)
        errors.add(:hospital, "Required hospital")
      end
    end
end
