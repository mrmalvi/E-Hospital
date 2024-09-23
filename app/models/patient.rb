class Patient < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
end
