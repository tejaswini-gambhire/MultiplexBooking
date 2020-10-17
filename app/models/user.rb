class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :booked_shows, class_name: 'Show', through: :bookings

  validates :email, :mobile_number, presence: true
  validates :email, :mobile_number, uniqueness: true
end
