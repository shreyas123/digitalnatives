class User < ActiveRecord::Base
  attr_accessible :name, :role_id

  belongs_to :role

  has_many :permission_roles, through: :role

  has_many :permission_users
  has_many :user_permissions, through: :permission_users, source: :permission ,class_name: "Permission"
  has_many :role_permissions, through: :permission_roles, source: :permission, class_name: "Permission"

  validates_presence_of :name

  def permissions
  	(user_permissions + role_permissions).uniq
  end
end
