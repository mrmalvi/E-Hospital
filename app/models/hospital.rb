class Hospital < ApplicationRecord
  validates :code, uniqueness: true

  has_many :doctors
  has_many :appointments
  has_many :patients, through: :appointments
end
