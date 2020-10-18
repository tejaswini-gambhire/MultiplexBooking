class Role < ApplicationRecord

  TYPES = {admin: 'Admin', customer: 'Customer'}.freeze

  has_many :users

  validates :name, presence: true, inclusion: {in: TYPES.values}

end
