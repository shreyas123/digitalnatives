class Role < ActiveRecord::Base
  attr_accessible :name

  has_many :users
  has_many :permission_roles
  has_many :permissions, through: :permission_roles
end
