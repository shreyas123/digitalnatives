class Permission < ActiveRecord::Base
  attr_accessible :name

  has_many :permission_users
  has_many :users, through: :permission_users
  has_many :permission_roles
  has_many :roles, through: :permission_roles

end
