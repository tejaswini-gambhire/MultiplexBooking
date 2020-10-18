class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :bookings
  has_many :booked_shows, class_name: 'Show', through: :bookings

  validates :email, :mobile_number, presence: true
  validates :email, :mobile_number, uniqueness: true

  ['admin', 'customer'].each  do |role_name|
    define_method("is_#{role_name}?") do
      self.role_id == ROLES.invert[Role::TYPES[role_name.to_sym]].to_i
    end
  end
end
